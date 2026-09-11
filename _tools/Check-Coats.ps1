<#
.SYNOPSIS
    Checks this mod's four patch files against the installed target mods, without RimWorld.

.DESCRIPTION
    Answers the three questions that do not need the game running:

      1. every defName this mod patches still exists in the mod it is meant for;
      2. none of them already carries alternateGraphics upstream, which would mean this mod
         writes nothing for that breed and the entry is dead weight;
      3. every colour parses the way Verse.ParseHelper.ParseColor would - three or four
         components, at least one of them greater than 1 so the 0-255 reading is taken.

    It also checks the shape of every operation: a PatchOperationConditional on
    .../alternateGraphics whose nomatch is a PatchOperationAdd on the same defName, carrying
    <success>Always</success>.

    Exits non-zero and names the breed on the first failure of any kind.

.PARAMETER WorkshopPath
    Steam workshop content folder for RimWorld. Defaults to the usual Windows location.

.PARAMETER DataPath
    RimWorld's Data folder, for the four base-game pets.
#>
[CmdletBinding()]
param(
    [string] $WorkshopPath = 'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100',
    [string] $DataPath     = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld\Data'
)

$ErrorActionPreference = 'Stop'
$modRoot  = Join-Path $PSScriptRoot '..\Mod' | Resolve-Path
$failures = New-Object System.Collections.Generic.List[string]

# Which patch file expects which mod. Core is the game itself; the rest are packageIds.
$targets = @(
    @{ File = 'Coats_StrayDogs.xml';                PackageId = 'Qux.stray.dogs';                        Label = 'Stray Dogs (rescued)' }
    @{ File = 'Coats_LetsHaveACat.xml';             PackageId = 'akairo.LetsHaveaCat';                   Label = "Let's Have a Cat! Continued" }
    @{ File = 'Coats_VanillaAnimalsExpanded.xml';   PackageId = 'VanillaExpanded.VanillaAnimalsExpanded'; Label = 'Vanilla Animals Expanded' }
    @{ File = 'Coats_Core.xml';                     PackageId = '';                                      Label = 'RimWorld Core' }
)

function Find-ModFolder([string] $packageId) {
    foreach ($about in [System.IO.Directory]::EnumerateFiles($WorkshopPath, 'About.xml', 'AllDirectories')) {
        if ((Split-Path (Split-Path $about -Parent) -Leaf) -ne 'About') { continue }
        $text = [System.IO.File]::ReadAllText($about)
        # A mod's own packageId is not always the first one in the file: dependencies carry
        # theirs too, and Vanilla Animals Expanded lists Harmony's before its own. Drop every
        # block that can hold someone else's identifier before looking.
        foreach ($tag in 'modDependencies', 'modDependenciesByVersion', 'loadAfter', 'loadBefore', 'incompatibleWith', 'forceLoadAfter', 'forceLoadBefore') {
            $text = [regex]::Replace($text, "(?s)<$tag>.*?</$tag>", '')
        }
        $m = [regex]::Match($text, '<packageId>([^<]+)</packageId>')
        if ($m.Success -and $m.Groups[1].Value.Trim() -ieq $packageId) {
            return (Split-Path (Split-Path $about -Parent) -Parent)
        }
    }
    return $null
}

# defName -> $true when the upstream def already has alternateGraphics.
function Read-UpstreamKinds([string] $root) {
    $kinds = @{}
    foreach ($file in [System.IO.Directory]::EnumerateFiles($root, '*.xml', 'AllDirectories')) {
        if ($file -match '\\Languages\\') { continue }
        $text = [System.IO.File]::ReadAllText($file)
        if ($text -notmatch '<PawnKindDef') { continue }
        foreach ($block in [regex]::Matches($text, '(?s)<PawnKindDef.*?</PawnKindDef>')) {
            $dn = [regex]::Match($block.Value, '<defName>([^<]+)</defName>')
            if (-not $dn.Success) { continue }
            $kinds[$dn.Groups[1].Value.Trim()] = ($block.Value -match '<alternateGraphics>')
        }
    }
    return $kinds
}

foreach ($target in $targets) {
    $patch = Join-Path $modRoot "Patches\$($target.File)"
    if (-not (Test-Path $patch)) { $failures.Add("missing patch file: $($target.File)"); continue }

    if ($target.PackageId) {
        $root = Find-ModFolder $target.PackageId
        if (-not $root) {
            Write-Host "SKIP  $($target.Label) is not installed - $($target.File) unchecked" -ForegroundColor Yellow
            continue
        }
    } else {
        $root = $DataPath
    }

    $kinds = Read-UpstreamKinds $root
    [xml] $doc = Get-Content $patch -Raw
    $checked = 0

    foreach ($op in $doc.Patch.Operation) {
        if ($op.Class -ne 'PatchOperationConditional') { $failures.Add("$($target.File): operation is not a conditional"); continue }

        $dn = [regex]::Match($op.xpath, 'defName = "([^"]+)"')
        if (-not $dn.Success) { $failures.Add("$($target.File): conditional xpath names no defName"); continue }
        $name = $dn.Groups[1].Value

        if ($op.xpath -notmatch '/alternateGraphics$') {
            $failures.Add("$name : the conditional must test /alternateGraphics")
        }

        $add = $op.nomatch
        if (-not $add -or $add.Class -ne 'PatchOperationAdd') { $failures.Add("$name : nomatch is not a PatchOperationAdd"); continue }
        if ($add.success -ne 'Always')                        { $failures.Add("$name : the add is missing <success>Always</success>") }
        if ($add.xpath -notmatch [regex]::Escape("defName = ""$name""")) { $failures.Add("$name : the add targets another def") }

        if (-not $kinds.ContainsKey($name)) {
            $failures.Add("$name : no such PawnKindDef in $($target.Label)")
            continue
        }
        if ($kinds[$name]) {
            $failures.Add("$name : $($target.Label) now ships its own alternateGraphics - this entry writes nothing")
        }

        $value = $add.value
        $chance = [double] $value.alternateGraphicChance
        if ($chance -le 0 -or $chance -gt 1) { $failures.Add("$name : alternateGraphicChance $chance is out of range") }

        $colours = @($value.alternateGraphics.li)
        if ($colours.Count -lt 2) { $failures.Add("$name : fewer than two coats") }
        foreach ($li in $colours) {
            $c = "$($li.color)".Trim()
            if ($c -notmatch '^\(\s*[\d.]+\s*,\s*[\d.]+\s*,\s*[\d.]+\s*(,\s*[\d.]+\s*)?\)$') {
                $failures.Add("$name : colour '$c' is not a colour")
                continue
            }
            $parts = $c.Trim('(', ')').Split(',') | ForEach-Object { [double] $_.Trim() }
            if (($parts[0] -le 1) -and ($parts[1] -le 1) -and ($parts[2] -le 1)) {
                $failures.Add("$name : colour '$c' would be read as 0-1, not 0-255")
            }
            foreach ($p in $parts) { if ($p -gt 255) { $failures.Add("$name : colour '$c' has a component over 255") } }
        }
        $checked++
    }

    Write-Host ("OK    {0,-30} {1} breeds checked against {2}" -f $target.File, $checked, $target.Label)
}

if ($failures.Count -gt 0) {
    Write-Host ''
    Write-Host "$($failures.Count) problem(s):" -ForegroundColor Red
    $failures | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    exit 1
}

Write-Host ''
Write-Host 'All checks passed.' -ForegroundColor Green
exit 0
