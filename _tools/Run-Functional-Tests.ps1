<#
.SYNOPSIS
  What the game actually does with this mod, checked outside the game.

.DESCRIPTION
  This mod is four patch files and no code, so the usual question - does the assembly still bind
  to the game - does not arise. Two others take its place, and both fail silently when the answer
  turns:

    Does the game still READ what these patches write?  A colour on an AlternateGraphic is a
    setting, and a setting nothing reads is inert. The mod would load, log nothing, and every
    animal would keep its one coat.

    Do these patches still WRITE what they are meant to?  A conditional that stops matching, a
    defName that moves, a guard that fires the wrong way - none of it is an error. The patch
    reports success and writes nothing.

  Nothing here is simulated. RimWorld's own patch engine runs on the real files:
  PatchOperationConditional and PatchOperationAdd are ordinary classes, they are built by
  reflection out of the shipped XML, and their Apply is called on a document built from the
  target mods' own defs. The verdict comes from the game's code, not from a description of it.

  Two things have to be worked around, and both are stated where they are done:

    DeepProfiler is enabled by default outside the game and its buffers are null, so Apply()
    throws in DeepProfiler.Start before it reaches the patch. The field is set to false first.

    Verse.ParseHelper.ParseColor cannot be called at all under Windows PowerShell 5.1: it uses
    String.Split(char, StringSplitOptions), an overload .NET Framework does not have. Its rule -
    a component greater than 1 means the triple is 0-255 - is therefore reimplemented here, and
    the line of the game it mirrors is quoted at the test.

  Four groups, twenty-two tests.

    A  the game reads what the mod writes        IL of Assembly-CSharp, swept for field readers
    B  the patches, run through the game engine  on the real defs of the real target mods
    C  the colours                               shape, effect, and provenance
    D  what ships                                the promises About.xml makes about the folder

  Exit code 0 when everything passes, 1 otherwise.

  ABOUT TWENTY-FIVE SECONDS, AND TEN MINUTES THE FIRST TIME. Finding a target mod means walking
  every About.xml under a workshop folder of nearly ten thousand mods, so the answer is cached in
  %TEMP%\rimworld-modfolder-cache.json and re-verified on each run rather than re-searched. Delete
  that file to force the long way round.

  SEVENTEEN OF THE TWENTY-TWO HAVE BEEN SEEN TO FAIL, one mutation at a time in a copy of the mod
  in a scratch directory, never in the real files. Sixteen mutations: a conditional that loses its
  field, a conditional pointed at a field that never exists, an operation stripped of its success
  flag, the same breed in two files, a breed that belongs to the sibling port, a colour on the 0-1
  scale, a coat of pure white, a colour repeated on one breed, a breed left with a single coat, a
  chance out of range, a colour that is not purpleyam's, a texture in the published folder, a
  banner at the wrong size, the full-resolution icon put back, a loadAfter entry dropped, and a
  hard dependency declared.

  The campaign paid for itself twice, and both faults were in this file rather than in the mod:

    - the absent-target-mod test built its operations with the success flag hard-coded to Always
      instead of reading the one the XML declares, so it passed with the flag stripped out;
    - the already-has-coats test only ever built the first of the forty-one operations, so a guard
      broken on any other breed went unseen.

  THE FIVE NOT SEEN RED are the four of group A and the negative control in group B. They assert
  the behaviour of the game's own assembly, and cannot be made to fail from this repository. The
  distinction is kept rather than glossed: a test never seen red is a test that has only ever been
  read.

.PARAMETER ModPath
  The mod folder. Defaults to the parent of this script.

.PARAMETER Managed
  RimWorld's Managed folder. Reference assemblies will not do: Krafs.Rimworld.Ref ships
  signatures with no bodies, and group A reads bodies.

.PARAMETER GameData
  RimWorld's Data folder. Point it at a doctored copy to see a data test fail.

.PARAMETER WorkshopPath
  Steam's workshop content folder for RimWorld, where the target mods live.

.PARAMETER SiblingPatches
  The Patches folder of Colorful Coats - Vanilla Animals Expanded! Renew, whose breeds this mod
  must not touch. Defaults to the sibling repository beside this one, and the test that uses it
  skips when it is not there.

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File _tools\Run-Functional-Tests.ps1

  The -ExecutionPolicy is needed from Git Bash, where this machine's policy refuses -File
  outright and leaves an empty output rather than an error.
#>
[CmdletBinding()]
param(
    [string] $ModPath      = '',
    [string] $Managed      = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld\RimWorldWin64_Data\Managed',
    [string] $GameData     = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld\Data',
    [string] $WorkshopPath = 'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100',
    [string] $SiblingPatches = ''
)

$ErrorActionPreference = 'Stop'
# Defaulted here rather than in the param block: under Windows PowerShell 5.1 $PSScriptRoot is
# still empty while parameter defaults are being bound.
if (-not $ModPath) { $ModPath = Join-Path $PSScriptRoot '..\Mod' }
$ModPath = (Resolve-Path $ModPath).Path

$script:pass = 0; $script:fail = 0; $script:skip = 0
function Test-That([string] $name, [scriptblock] $body) {
    try {
        $r = & $body
        # `$r -eq 'skip'` is NOT the test it looks like: PowerShell converts the string to a
        # boolean when the left side is one, and every non-empty string is true - so a passing
        # test would announce itself as skipped. The type has to be checked first.
        if (($r -is [string]) -and ($r -eq 'skip')) { $script:skip++; Write-Host ("SKIP  {0}" -f $name) -ForegroundColor Yellow; return }
        if ($r) { $script:pass++; Write-Host ("ok    {0}" -f $name) -ForegroundColor Green }
        else    { $script:fail++; Write-Host ("FAIL  {0}" -f $name) -ForegroundColor Red }
    } catch {
        $script:fail++
        $ex = $_.Exception; while ($ex.InnerException) { $ex = $ex.InnerException }
        Write-Host ("FAIL  {0}`n        {1}: {2}" -f $name, $ex.GetType().Name, $ex.Message) -ForegroundColor Red
    }
}
function Say([string] $line) { Write-Host "        $line" -ForegroundColor DarkGray }

# ---------------------------------------------------------------------------------------------
# Loading the game

# An unresolvable assembly name asked for twice recurses to a stack overflow rather than to an
# error, so what has been tried is remembered. Same handler and same guard as the monorepo's
# Check-XmlFields.ps1.
$script:probed = @{}
[System.AppDomain]::CurrentDomain.add_AssemblyResolve([System.ResolveEventHandler] {
    param($sender, $e)
    if ($null -eq $script:probed) { return $null }
    $short = $e.Name.Split(',')[0]
    if ($script:probed.ContainsKey($short)) { return $null }
    $script:probed[$short] = $true
    $p = Join-Path $Managed "$short.dll"
    if (Test-Path $p) { return [System.Reflection.Assembly]::LoadFrom($p) }
    return $null
})

$asm = [System.Reflection.Assembly]::LoadFrom((Join-Path $Managed 'Assembly-CSharp.dll'))
$NPI = [System.Reflection.BindingFlags] 'NonPublic,Public,Instance'
$NPS = [System.Reflection.BindingFlags] 'NonPublic,Public,Static'

# GetTypes always throws here - Unity is missing - and the exception carries every type it did
# resolve, which is all but a handful. PowerShell wraps it, so both shapes are caught.
function Get-AllTypes($assembly) {
    try     { return $assembly.GetTypes() }
    catch [System.Reflection.ReflectionTypeLoadException] { return $_.Exception.Types | Where-Object { $_ } }
    catch   { return $_.Exception.InnerException.Types | Where-Object { $_ } }
}
$allTypes = Get-AllTypes $asm

# Apply() opens on `if (DeepProfiler.enabled)`, and outside the game that field is true while the
# profiler's own buffers are null - so it throws a NullReferenceException in DeepProfiler.Start
# before reaching a single line of patch code. Turning it off is what makes the real Apply, with
# its success handling, callable here.
$asm.GetType('Verse.DeepProfiler').GetField('enabled', $NPS).SetValue($null, $false)

function Set-Field($obj, [string] $name, $value) {
    $t = $obj.GetType()
    while ($t) {
        $f = $t.GetField($name, $NPI)
        if ($f) { $f.SetValue($obj, $value); return }
        $t = $t.BaseType
    }
    throw "no field '$name' on $($obj.GetType().FullName)"
}
function Get-Field($obj, [string] $name) {
    $t = $obj.GetType()
    while ($t) {
        $f = $t.GetField($name, $NPI)
        if ($f) { return $f.GetValue($obj) }
        $t = $t.BaseType
    }
    throw "no field '$name' on $($obj.GetType().FullName)"
}

# ---------------------------------------------------------------------------------------------
# Reading the mod

$patchFiles = Get-ChildItem (Join-Path $ModPath 'Patches') -Filter '*.xml' | Sort-Object Name

# One entry per <Operation> in the shipped files: the defName it aims at, the colours it lists,
# the chance, and a factory that builds the real RimWorld objects out of that same XML. The
# factory is a function of the file rather than a copy of it - a test that rebuilt the operation
# by hand would test the copy.
$ops = @()
foreach ($f in $patchFiles) {
    [xml] $doc = Get-Content $f.FullName -Raw -Encoding UTF8
    foreach ($opNode in $doc.Patch.Operation) {
        $add = $opNode.nomatch
        $defName = ([regex]::Match($opNode.xpath, 'defName = "([^"]+)"')).Groups[1].Value
        $ops += [pscustomobject] @{
            File     = $f.Name
            DefName  = $defName
            Chance   = [double] $add.value.alternateGraphicChance
            Colours  = @(@($add.value.alternateGraphics.li) | ForEach-Object { "$($_.color)".Trim() })
            CondPath = $opNode.xpath
            AddPath  = $add.xpath
            Success  = "$($add.success)"
            ValueXml = $add.SelectSingleNode('value').OuterXml
        }
    }
}

# Builds the pair of real objects for one operation, with the success flag THE FILE DECLARES -
# not a fixed Always. The first version of this hard-coded Always, so the test that checks an
# absent target mod costs nothing passed even with the flag stripped out of the XML; the mutation
# campaign is what caught it.
#
# $successOverride is for the negative control below: the same operation with the flag cleared
# must report failure where the shipped one reports success, which is the only thing that proves
# the absent-mod test is testing anything at all.
function New-RealOperation($op, [int] $successOverride = -1) {
    if ($successOverride -lt 0) { $successOverride = $(if ($op.Success -eq 'Always') { 2 } else { 0 }) }
    $vdoc = New-Object System.Xml.XmlDocument
    $vdoc.LoadXml($op.ValueXml)
    $container = [Activator]::CreateInstance($asm.GetType('Verse.XmlContainer'))
    Set-Field $container 'node' $vdoc.DocumentElement

    $add = [Activator]::CreateInstance($asm.GetType('Verse.PatchOperationAdd'))
    Set-Field $add 'xpath'   $op.AddPath
    Set-Field $add 'value'   $container
    Set-Field $add 'success' $successOverride

    $cond = [Activator]::CreateInstance($asm.GetType('Verse.PatchOperationConditional'))
    Set-Field $cond 'xpath'   $op.CondPath
    Set-Field $cond 'nomatch' $add
    return $cond
}

# ---------------------------------------------------------------------------------------------
# Finding the target mods, and building the document the game would patch

# Where a packageId was found last time. Looking it up means walking every About.xml of a workshop
# folder that holds the better part of ten thousand mods, and this script does it once per target -
# so the answer is cached beside the temp folder and re-verified rather than re-searched. The cache
# is never trusted blind: the recorded folder has to still declare that packageId, which is what
# makes a mod that was moved, unsubscribed or renamed fall back to a full search.
$script:cachePath = Join-Path $env:TEMP 'rimworld-modfolder-cache.json'
$script:cache = @{}
if (Test-Path $script:cachePath) {
    try {
        $raw = Get-Content $script:cachePath -Raw -Encoding UTF8 | ConvertFrom-Json
        foreach ($p in $raw.PSObject.Properties) { $script:cache[$p.Name] = $p.Value }
    } catch { $script:cache = @{} }
}
function Test-ModFolder([string] $root, [string] $packageId) {
    if (-not $root -or -not (Test-Path $root)) { return $false }
    $about = Join-Path $root 'About\About.xml'
    if (-not (Test-Path $about)) { return $false }
    $text = [System.IO.File]::ReadAllText($about)
    foreach ($tag in 'modDependencies','modDependenciesByVersion','loadAfter','loadBefore','incompatibleWith','forceLoadAfter','forceLoadBefore') {
        $text = [regex]::Replace($text, "(?s)<$tag>.*?</$tag>", '')
    }
    $m = [regex]::Match($text, '<packageId>([^<]+)</packageId>')
    return ($m.Success -and $m.Groups[1].Value.Trim() -ieq $packageId)
}
function Find-ModFolder([string] $packageId) {
    if ($script:cache.ContainsKey($packageId) -and (Test-ModFolder $script:cache[$packageId] $packageId)) {
        return $script:cache[$packageId]
    }
    if (-not (Test-Path $WorkshopPath)) { return $null }
    foreach ($about in [System.IO.Directory]::EnumerateFiles($WorkshopPath, 'About.xml', 'AllDirectories')) {
        if ((Split-Path (Split-Path $about -Parent) -Leaf) -ne 'About') { continue }
        $text = [System.IO.File]::ReadAllText($about)
        # A mod's own packageId is not always the first in the file - dependencies carry theirs
        # too, and Vanilla Animals Expanded lists Harmony's before its own.
        foreach ($tag in 'modDependencies','modDependenciesByVersion','loadAfter','loadBefore','incompatibleWith','forceLoadAfter','forceLoadBefore') {
            $text = [regex]::Replace($text, "(?s)<$tag>.*?</$tag>", '')
        }
        $m = [regex]::Match($text, '<packageId>([^<]+)</packageId>')
        if ($m.Success -and $m.Groups[1].Value.Trim() -ieq $packageId) {
            $found = Split-Path (Split-Path $about -Parent) -Parent
            $script:cache[$packageId] = $found
            try { $script:cache | ConvertTo-Json | Out-File -FilePath $script:cachePath -Encoding UTF8 } catch { }
            return $found
        }
    }
    return $null
}

# Every PawnKindDef of a mod, gathered into the single <Defs> document RimWorld patches. The
# game builds one document out of every def file of every active mod; this is that document
# narrowed to one mod, which is all these patches ever touch.
function New-DefsDocument([string] $root) {
    $doc = New-Object System.Xml.XmlDocument
    $doc.LoadXml('<Defs/>')
    foreach ($file in [System.IO.Directory]::EnumerateFiles($root, '*.xml', 'AllDirectories')) {
        if ($file -match '\\Languages\\') { continue }
        $text = [System.IO.File]::ReadAllText($file)
        if ($text -notmatch '<PawnKindDef') { continue }
        $sub = New-Object System.Xml.XmlDocument
        try { $sub.LoadXml($text) } catch { continue }
        foreach ($node in $sub.SelectNodes('//PawnKindDef')) {
            [void] $doc.DocumentElement.AppendChild($doc.ImportNode($node, $true))
        }
    }
    return $doc
}

$targets = @(
    @{ File = 'Coats_StrayDogs.xml';              PackageId = 'Qux.stray.dogs';                         Label = 'Stray Dogs (rescued)' }
    @{ File = 'Coats_LetsHaveACat.xml';           PackageId = 'akairo.LetsHaveaCat';                    Label = "Let's Have a Cat! Continued" }
    @{ File = 'Coats_VanillaAnimalsExpanded.xml'; PackageId = 'VanillaExpanded.VanillaAnimalsExpanded';  Label = 'Vanilla Animals Expanded' }
    @{ File = 'Coats_Core.xml';                   PackageId = '';                                       Label = 'RimWorld Core' }
)
foreach ($t in $targets) {
    $t.Root = if ($t.PackageId) { Find-ModFolder $t.PackageId } else { $GameData }
    $t.Doc  = if ($t.Root) { New-DefsDocument $t.Root } else { $null }
}

Write-Host ''
Write-Host 'A. The game reads what the mod writes' -ForegroundColor Cyan

# Which methods read a given field, read off the compiled game rather than asserted. Within one
# module a field token in an IL stream IS the field's own MetadataToken, so no ResolveMember call
# is needed per instruction; that is what makes a sweep of the whole assembly affordable.
#
# The sweep itself is compiled rather than written in PowerShell. Assembly-CSharp holds some
# 16 000 types and well over a hundred thousand method bodies, and a PowerShell loop over their
# bytes does not finish in any reasonable time - the first version of this file ran for ten
# minutes without reaching the second test.
#
# Two known limits, neither of which the tests below lean on:
#   - the scan does not follow instruction boundaries, so a four-byte operand that happens to
#     equal a token reads as a hit. Every test here names the reader it expects instead of
#     trusting a count.
#   - a field read only through reflection is invisible to it, which would be a false negative.
Add-Type -TypeDefinition @'
using System;
using System.Collections.Generic;
using System.Reflection;
public static class IlFieldSweep {
    public static string[] Readers(Assembly asm, int[] tokens) {
        var res = new List<string>();
        Type[] types;
        try { types = asm.GetTypes(); }
        catch (ReflectionTypeLoadException e) { types = e.Types; }
        const BindingFlags F = BindingFlags.NonPublic | BindingFlags.Public
                             | BindingFlags.Instance | BindingFlags.Static | BindingFlags.DeclaredOnly;
        foreach (var t in types) {
            if (t == null) continue;
            // Whole-type guard rather than one per call: a type that half-loaded without Unity
            // throws TypeLoadException from DeclaringType as readily as from GetMethods, and one
            // bad type must not cost the sweep.
            try {
            Type outer = t;
            while (outer.DeclaringType != null) outer = outer.DeclaringType;
            MethodInfo[] methods;
            try { methods = t.GetMethods(F); } catch { continue; }
            foreach (var m in methods) {
                byte[] il = null;
                try { var b = m.GetMethodBody(); if (b != null) il = b.GetILAsByteArray(); } catch { }
                if (il == null) continue;
                for (int i = 0; i + 4 < il.Length; i++) {
                    if (il[i] != 0x7B && il[i] != 0x7E) continue;          // ldfld, ldsfld
                    int tok = il[i+1] | (il[i+2] << 8) | (il[i+3] << 16) | (il[i+4] << 24);
                    for (int k = 0; k < tokens.Length; k++)
                        if (tokens[k] == tok) res.Add(tokens[k] + "\t" + outer.Name + "." + m.Name);
                }
            }
            } catch { }
        }
        return res.ToArray();
    }
}
'@ -ErrorAction SilentlyContinue

$script:readerCache = $null
function Get-Readers([System.Reflection.FieldInfo] $field) {
    if ($null -eq $script:readerCache) {
        $fields = @(
            $asm.GetType('Verse.PawnKindDef').GetField('alternateGraphics', $NPI)
            $asm.GetType('Verse.PawnKindDef').GetField('alternateGraphicChance', $NPI)
            $asm.GetType('Verse.AlternateGraphic').GetField('color', $NPI)
            $asm.GetType('Verse.AlternateGraphic').GetField('texPath', $NPI)
            $asm.GetType('Verse.AlternateGraphic').GetField('weight', $NPI)
        )
        $tokens = [int[]] @($fields | ForEach-Object { $_.MetadataToken })
        $script:readerCache = @{}
        foreach ($tok in $tokens) { $script:readerCache[$tok] = @() }
        foreach ($hit in [IlFieldSweep]::Readers($asm, $tokens)) {
            $parts = $hit.Split("`t")
            $script:readerCache[[int] $parts[0]] += $parts[1]
        }
    }
    return ($script:readerCache[$field.MetadataToken] | Select-Object -Unique)
}

$pawnKindDef     = $asm.GetType('Verse.PawnKindDef')
$alternateGraphic = $asm.GetType('Verse.AlternateGraphic')

Test-That 'alternateGraphics and alternateGraphicChance are read, by PawnGraphicUtils.TryGetAlternate' {
    $r1 = Get-Readers $pawnKindDef.GetField('alternateGraphics', $NPI)
    $r2 = Get-Readers $pawnKindDef.GetField('alternateGraphicChance', $NPI)
    Say ("alternateGraphics: " + ($r1 -join ', '))
    Say ("alternateGraphicChance: " + ($r2 -join ', '))
    ($r1 -contains 'PawnGraphicUtils.TryGetAlternate') -and ($r2 -contains 'PawnGraphicUtils.TryGetAlternate')
}

Test-That 'AlternateGraphic.color is read - without a reader every coat here would be inert' {
    $r = Get-Readers $alternateGraphic.GetField('color', $NPI)
    Say ($r -join ', ')
    $r -contains 'AlternateGraphic.GetGraphic'
}

Test-That 'AlternateGraphic.texPath is read by the same method, which is the branch that keeps the sprite' {
    $r = Get-Readers $alternateGraphic.GetField('texPath', $NPI)
    Say ($r -join ', ')
    $r -contains 'AlternateGraphic.GetGraphic'
}

Test-That 'AlternateGraphic.weight is read, so leaving it at its default draws the coats evenly' {
    $r = Get-Readers $alternateGraphic.GetField('weight', $NPI)
    Say ($r -join ', ')
    $r.Count -gt 0
}

Write-Host ''
Write-Host 'B. The patches, run through the game''s own engine' -ForegroundColor Cyan

Test-That 'every operation writes its coats onto the real defs of its target mod' {
    $bad = @()
    $done = 0
    foreach ($t in $targets) {
        if (-not $t.Doc) { continue }
        $doc = $t.Doc.Clone()
        foreach ($op in ($ops | Where-Object { $_.File -eq $t.File })) {
            $real = New-RealOperation $op
            [void] $real.Apply($doc.PSObject.BaseObject)
            $node = $doc.SelectSingleNode("/Defs/PawnKindDef[defName = '$($op.DefName)']")
            if (-not $node) { $bad += "$($op.DefName): not in $($t.Label)"; continue }
            $got = @($node.SelectNodes('alternateGraphics/li/color') | ForEach-Object { $_.InnerText.Trim() })
            if (($got -join '|') -ne ($op.Colours -join '|')) { $bad += "$($op.DefName): wrote [$($got -join ' ')] instead of [$($op.Colours -join ' ')]" }
            $chance = $node.SelectSingleNode('alternateGraphicChance')
            if (-not $chance -or [double] $chance.InnerText -ne $op.Chance) { $bad += "$($op.DefName): chance not written" }
            $done++
        }
    }
    if ($done -eq 0) { return 'skip' }
    Say "$done breeds patched for real"
    $bad | ForEach-Object { Say $_ }
    $bad.Count -eq 0
}

# Every operation, not one of them: the first version of this test only ever built $ops[0], so a
# guard broken on any other breed went unseen. The mutation campaign caught that too.
Test-That 'a breed that already has coats is left alone, on every one of them' {
    $bad = @()
    foreach ($op in $ops) {
        $doc = New-Object System.Xml.XmlDocument
        $doc.LoadXml("<Defs><PawnKindDef><defName>$($op.DefName)</defName><alternateGraphicChance>0.9</alternateGraphicChance><alternateGraphics><li><texPath>Someone/Elses/Art</texPath></li></alternateGraphics></PawnKindDef></Defs>")
        $real = New-RealOperation $op
        $r = $real.Apply($doc.PSObject.BaseObject)
        $lists = $doc.SelectNodes('//alternateGraphics').Count
        $kept  = $doc.SelectSingleNode('//alternateGraphics/li/texPath')
        if (-not $r)                   { $bad += "$($op.DefName): reported failure" }
        if ($lists -ne 1)              { $bad += "$($op.DefName): $lists coat lists on one def" }
        if (-not $kept -or $kept.InnerText -ne 'Someone/Elses/Art') { $bad += "$($op.DefName): the existing coats were overwritten" }
    }
    Say "$($ops.Count) breeds offered a coat list they already had"
    $bad | ForEach-Object { Say $_ }
    $bad.Count -eq 0
}

Test-That 'a target mod that is absent costs nothing: every operation still reports success' {
    $doc = New-Object System.Xml.XmlDocument
    $doc.LoadXml('<Defs/>')
    $bad = @()
    foreach ($op in $ops) {
        $real = New-RealOperation $op
        if (-not $real.Apply($doc.PSObject.BaseObject)) { $bad += $op.DefName }
    }
    Say "$($ops.Count) operations against an empty document"
    $bad | ForEach-Object { Say "reported failure: $_" }
    $bad.Count -eq 0
}

Test-That 'and that is the Always flag doing it, not the conditional: cleared, the same operation fails' {
    $doc = New-Object System.Xml.XmlDocument
    $doc.LoadXml('<Defs/>')
    $real = New-RealOperation $ops[0] 0      # Success.Normal
    $r = $real.Apply($doc.PSObject.BaseObject)
    Say "with <success> cleared: $r"
    -not $r
}

Test-That 'every shipped operation carries the flag, on the add and not only on a container' {
    $bad = @($ops | Where-Object { $_.Success -ne 'Always' })
    $bad | ForEach-Object { Say "$($_.DefName) in $($_.File)" }
    $bad.Count -eq 0
}

Test-That 'the conditional tests the field it is meant to test' {
    $bad = @($ops | Where-Object { $_.CondPath -notmatch '/alternateGraphics$' -or $_.AddPath -notmatch "defName = ""$([regex]::Escape($_.DefName))""" })
    $bad | ForEach-Object { Say "$($_.DefName): cond '$($_.CondPath)' add '$($_.AddPath)'" }
    $bad.Count -eq 0
}

Test-That 'no breed is claimed by two of this mod''s own files' {
    $dup = $ops | Group-Object DefName | Where-Object { $_.Count -gt 1 }
    $dup | ForEach-Object { Say "$($_.Name) in $((($_.Group).File | Select-Object -Unique) -join ', ')" }
    $dup.Count -eq 0
}

Test-That 'no breed is shared with Colorful Coats - Vanilla Animals Expanded! Renew' {
    $sibling = $SiblingPatches
    if (-not $sibling) { $sibling = Join-Path (Split-Path (Split-Path $ModPath -Parent) -Parent) 'ColorfulCoatsVAERenew\Mod\Patches' }
    if (-not (Test-Path $sibling)) { return 'skip' }
    $theirs = @()
    foreach ($f in (Get-ChildItem $sibling -Filter '*.xml')) {
        $theirs += [regex]::Matches((Get-Content $f.FullName -Raw), 'defName = "([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
    }
    $shared = @($ops.DefName | Where-Object { $theirs -contains $_ })
    Say "$($theirs.Count) defNames on their side, $($shared.Count) shared"
    $shared | ForEach-Object { Say "shared: $_" }
    $shared.Count -eq 0
}

Write-Host ''
Write-Host 'C. The colours' -ForegroundColor Cyan

# Verse.ParseHelper.ParseColor cannot be invoked under Windows PowerShell 5.1 - it calls
# String.Split(char, StringSplitOptions), which .NET Framework does not have - so its one
# decisive rule is mirrored here. In the game:
#
#     if (!(num > 1f) && !(num3 > 1f)) { ... 0-1 reading ... } else { ... 0-255 reading ... }
#
# A triple whose components are all 1 or less is read as 0-1, which would turn (0,0,0)-ish
# values into near-black coats instead of the intended shades.
function Read-Colour([string] $s) {
    if ($s -notmatch '^\(\s*[\d.]+\s*,\s*[\d.]+\s*,\s*[\d.]+\s*(,\s*[\d.]+\s*)?\)$') { return $null }
    $parts = $s.Trim('(', ')').Split(',') | ForEach-Object { [double] $_.Trim() }
    $is255 = ($parts[0] -gt 1) -or ($parts[1] -gt 1) -or ($parts[2] -gt 1)
    return [pscustomobject] @{ R = $parts[0]; G = $parts[1]; B = $parts[2]; Is255 = $is255 }
}

Test-That 'every colour is well formed and read on the 0-255 scale, as the game reads it' {
    $bad = @()
    foreach ($op in $ops) { foreach ($c in $op.Colours) {
        $col = Read-Colour $c
        if (-not $col)      { $bad += "$($op.DefName): '$c' is not a colour" }
        elseif (-not $col.Is255) { $bad += "$($op.DefName): '$c' would be read as 0-1" }
        elseif ($col.R -gt 255 -or $col.G -gt 255 -or $col.B -gt 255) { $bad += "$($op.DefName): '$c' is over 255" }
    } }
    $bad | ForEach-Object { Say $_ }
    $bad.Count -eq 0
}

Test-That 'every coat changes something: a tint of pure white would be the original again' {
    $bad = @()
    foreach ($op in $ops) { foreach ($c in $op.Colours) {
        $col = Read-Colour $c
        if ($col -and $col.R -ge 255 -and $col.G -ge 255 -and $col.B -ge 255) { $bad += "$($op.DefName): '$c' is a no-op" }
    } }
    $bad | ForEach-Object { Say $_ }
    $bad.Count -eq 0
}

Test-That 'no breed lists the same colour twice - a duplicate is a wasted slot, not a rarer coat' {
    $bad = @()
    foreach ($op in $ops) {
        $dup = $op.Colours | Group-Object | Where-Object { $_.Count -gt 1 }
        foreach ($d in $dup) { $bad += "$($op.DefName): $($d.Name) x$($d.Count)" }
    }
    $bad | ForEach-Object { Say $_ }
    $bad.Count -eq 0
}

Test-That 'every breed has at least two coats and a chance between 0 and 1' {
    $bad = @()
    foreach ($op in $ops) {
        if ($op.Colours.Count -lt 2)              { $bad += "$($op.DefName): $($op.Colours.Count) coat(s)" }
        if ($op.Chance -le 0 -or $op.Chance -gt 1) { $bad += "$($op.DefName): chance $($op.Chance)" }
    }
    $bad | ForEach-Object { Say $_ }
    $bad.Count -eq 0
}

Test-That 'every colour is one purpleyam actually painted, measured out of their mod' {
    $src = Join-Path $WorkshopPath '2388932599\Textures\Things\Pawn\Animal'
    $vae = Join-Path $WorkshopPath '2871933948\Textures\Things\Pawn\Animal'
    if (-not (Test-Path $src) -or -not (Test-Path $vae)) { return 'skip' }
    Add-Type -AssemblyName System.Drawing

    function Get-Mean([string] $p) {
        $bmp = [System.Drawing.Bitmap]::FromFile($p)
        [double] $sr = 0; [double] $sg = 0; [double] $sb = 0; [int] $n = 0
        for ($y = 0; $y -lt $bmp.Height; $y += 2) { for ($x = 0; $x -lt $bmp.Width; $x += 2) {
            $c = $bmp.GetPixel($x, $y)
            if ($c.A -gt 200) { $sr += [double] $c.R; $sg += [double] $c.G; $sb += [double] $c.B; $n++ }
        } }
        $bmp.Dispose()
        if ($n -eq 0) { return $null }
        return [pscustomobject] @{ R = $sr / $n; G = $sg / $n; B = $sb / $n }
    }

    $map = [ordered] @{
        'CatBengal'='AEXP_CatBengal\CatBengal'; 'CatBritishShorthair'='AEXP_CatBritishShorthair\CatBritishShorthair'
        'CatMaineCoon'='AEXP_CatMaineCoon\CatMaineCoon'; 'CatMunchkin'='AEXP_CatMunchkin\CatMunchkin'
        'CatNorwegian'='AEXP_CatNorwegian\CatNorwegian'; 'CatPersian'='AEXP_CatPersian\CatPersian'
        'CatSiamese'='AEXP_CatSiamese\CatSiamese'; 'CatSomali'='AEXP_CatSomali\CatSomali'
        'CatSphynx'='AEXP_CatSphynx\CatSphynx'; 'Chihuahua'='AEXP_Chihuahua\Chihuahua'
        'GreatDane'='AEXP_GreatDane\GreatDane'; 'Poodle'='AEXP_Poodle\Poodle'
        'Rottweiler'='AEXP_Rottweiler\Rottweiler'; 'ShihTzu'='AEXP_ShihTzu\ShihTzu'
    }
    $palette = @{}
    foreach ($breed in $map.Keys) {
        $basePath = Join-Path $vae ($map[$breed] + '_south.png')
        if (-not (Test-Path $basePath)) { continue }
        $b = Get-Mean $basePath
        foreach ($coat in (Get-ChildItem (Join-Path $src $breed) -Filter '*_south.png')) {
            $m = Get-Mean $coat.FullName
            $t = @((255 * $m.R / $b.R), (255 * $m.G / $b.G), (255 * $m.B / $b.B))
            if (@($t | Where-Object { $_ -gt 254 }).Count -ge 2) { continue }   # a repaint, not a shade
            $palette["({0},{1},{2})" -f [int] [math]::Min(255,$t[0]), [int] [math]::Min(255,$t[1]), [int] [math]::Min(255,$t[2])] = $coat.BaseName
        }
    }
    Say "$($palette.Count) tints recovered from purpleyam's coats"
    $used = @($ops.Colours | Select-Object -Unique)
    $bad  = @($used | Where-Object { -not $palette.ContainsKey($_) })
    $bad | ForEach-Object { Say "not theirs: $_" }
    Say ("used {0} of the {1}" -f ($used.Count - $bad.Count), $palette.Count)
    $bad.Count -eq 0
}

Write-Host ''
Write-Host 'D. What ships' -ForegroundColor Cyan

Test-That 'the published folder contains no texture, which is the mod''s whole claim' {
    $imgs = @(Get-ChildItem $ModPath -Recurse -Include '*.png','*.jpg','*.psd' | Where-Object { $_.Directory.Name -ne 'About' })
    $imgs | ForEach-Object { Say $_.FullName }
    $imgs.Count -eq 0
}

Test-That 'Preview.png is 896 x 504 and under 900 KB' {
    Add-Type -AssemblyName System.Drawing
    $p = Join-Path $ModPath 'About\Preview.png'
    if (-not (Test-Path $p)) { Say 'missing'; return $false }
    $i = [System.Drawing.Image]::FromFile($p); $w = $i.Width; $h = $i.Height; $i.Dispose()
    $kb = [int] ((Get-Item $p).Length / 1KB)
    Say "$w x $h, $kb KB"
    $w -eq 896 -and $h -eq 504 -and $kb -lt 900
}

Test-That 'ModIcon.png is 128 x 128 and under 60 KB' {
    Add-Type -AssemblyName System.Drawing
    $p = Join-Path $ModPath 'About\ModIcon.png'
    if (-not (Test-Path $p)) { Say 'missing'; return $false }
    $i = [System.Drawing.Image]::FromFile($p); $w = $i.Width; $h = $i.Height; $i.Dispose()
    $kb = [int] ((Get-Item $p).Length / 1KB)
    Say "$w x $h, $kb KB"
    $w -eq 128 -and $h -eq 128 -and $kb -lt 60
}

Test-That 'About.xml loads after every mod that paints coats for the same animals' {
    [xml] $about = Get-Content (Join-Path $ModPath 'About\About.xml') -Raw -Encoding UTF8
    $after = @($about.ModMetaData.loadAfter.li)
    $need = @('Qux.stray.dogs','akairo.LetsHaveaCat','VanillaExpanded.VanillaAnimalsExpanded',
              'nelim.colorfulcoats.vaerenew','Erin.Cats','cucumpear.azrael.varietycoats')
    $missing = @($need | Where-Object { $after -notcontains $_ })
    $missing | ForEach-Object { Say "missing: $_" }
    $missing.Count -eq 0
}

Test-That 'the mod declares no dependency: any one of the four targets is enough, none is required' {
    [xml] $about = Get-Content (Join-Path $ModPath 'About\About.xml') -Raw -Encoding UTF8
    $deps = @($about.ModMetaData.modDependencies)
    -not $about.ModMetaData.modDependencies
}

Write-Host ''
Write-Host ("{0} passed, {1} failed, {2} skipped" -f $script:pass, $script:fail, $script:skip)
if ($script:fail -gt 0) { exit 1 }
exit 0
