<#
.SYNOPSIS
    Recomputes this mod's palette from purpleyam's Colorful Coats - Cats and Dogs!

.DESCRIPTION
    This mod ships no texture, and its colours are not invented: each one is one of the 78 coats
    purpleyam painted, expressed as the tint that would produce it.

    For every coat texture in the original mod, this measures the mean colour of its opaque
    pixels, measures the same for the sprite it was painted over in Vanilla Animals Expanded,
    and divides one by the other. That ratio, times 255, is what <color> has to be for
    AlternateGraphic.GetGraphic to land on purpleyam's coat starting from the original sprite.

    A ratio that clamps at 255 on two channels or more means the coat is LIGHTER than the sprite
    underneath, or a repaint rather than a shade. A multiply cannot reach those, and they are
    reported as unusable rather than silently rounded down. Thirteen of the 78 survive, and those
    thirteen are the palette in Mod/Patches/*.xml.

    Nothing is written: this prints, and the patches are edited by hand from what it prints.

.PARAMETER SourceMod
    purpleyam's Colorful Coats - Cats and Dogs!, Workshop item 2388932599.

.PARAMETER BaseMod
    Vanilla Animals Expanded, Workshop item 2871933948, which carries the sprites the coats
    were painted over - they were Vanilla Animals Expanded - Cats and Dogs' when purpleyam
    painted them, and that module has since been absorbed.
#>
[CmdletBinding()]
param(
    [string] $SourceMod = 'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\2388932599',
    [string] $BaseMod   = 'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\2871933948'
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$src = Join-Path $SourceMod 'Textures\Things\Pawn\Animal'
$vae = Join-Path $BaseMod   'Textures\Things\Pawn\Animal'

function Get-Mean {
    param([string] $Path)
    $bmp = [System.Drawing.Bitmap]::FromFile($Path)
    [double] $sr = 0; [double] $sg = 0; [double] $sb = 0; [int] $n = 0
    for ($y = 0; $y -lt $bmp.Height; $y += 2) {
        for ($x = 0; $x -lt $bmp.Width; $x += 2) {
            $c = $bmp.GetPixel($x, $y)
            if ($c.A -gt 200) { $sr += [double] $c.R; $sg += [double] $c.G; $sb += [double] $c.B; $n++ }
        }
    }
    $bmp.Dispose()
    if ($n -eq 0) { return $null }
    return [pscustomobject] @{ R = $sr / $n; G = $sg / $n; B = $sb / $n }
}

# purpleyam's texture folder -> the folder and file stem of the same breed in Vanilla Animals
# Expanded. Two of the fourteen differ in spelling between the two mods: CatNorwegian is the
# def AEXP_CatNorwegianForest, and ShihTzu is the def AEXP_Shih-Tzu.
$map = [ordered] @{
    'CatBengal'           = 'AEXP_CatBengal\CatBengal'
    'CatBritishShorthair' = 'AEXP_CatBritishShorthair\CatBritishShorthair'
    'CatMaineCoon'        = 'AEXP_CatMaineCoon\CatMaineCoon'
    'CatMunchkin'         = 'AEXP_CatMunchkin\CatMunchkin'
    'CatNorwegian'        = 'AEXP_CatNorwegian\CatNorwegian'
    'CatPersian'          = 'AEXP_CatPersian\CatPersian'
    'CatSiamese'          = 'AEXP_CatSiamese\CatSiamese'
    'CatSomali'           = 'AEXP_CatSomali\CatSomali'
    'CatSphynx'           = 'AEXP_CatSphynx\CatSphynx'
    'Chihuahua'           = 'AEXP_Chihuahua\Chihuahua'
    'GreatDane'           = 'AEXP_GreatDane\GreatDane'
    'Poodle'              = 'AEXP_Poodle\Poodle'
    'Rottweiler'          = 'AEXP_Rottweiler\Rottweiler'
    'ShihTzu'             = 'AEXP_ShihTzu\ShihTzu'
}

if (-not (Test-Path $src)) { Write-Host "purpleyam's mod is not installed at $SourceMod" -ForegroundColor Yellow; exit 2 }
if (-not (Test-Path $vae)) { Write-Host "Vanilla Animals Expanded is not installed at $BaseMod" -ForegroundColor Yellow; exit 2 }

$usable = New-Object System.Collections.Generic.List[string]

foreach ($breed in $map.Keys) {
    $basePath = Join-Path $vae ($map[$breed] + '_south.png')
    if (-not (Test-Path $basePath)) { Write-Host ("{0,-20} base sprite missing" -f $breed) -ForegroundColor Yellow; continue }
    $b = Get-Mean $basePath
    Write-Host ("{0,-20} sprite {1,3} {2,3} {3,3}" -f $breed, [int] $b.R, [int] $b.G, [int] $b.B)

    Get-ChildItem (Join-Path $src $breed) -Filter '*_south.png' | Sort-Object Name | ForEach-Object {
        $m = Get-Mean $_.FullName
        # Each element is parenthesised on purpose: in PowerShell the comma binds tighter than
        # the arithmetic operators, so `a / b, c / d` divides by the array `(b, c)` and throws.
        $t = @((255 * $m.R / $b.R), (255 * $m.G / $b.G), (255 * $m.B / $b.B))
        $clamped = @($t | Where-Object { $_ -gt 254 }).Count
        $tint = "({0},{1},{2})" -f [int] [math]::Min(255, $t[0]), [int] [math]::Min(255, $t[1]), [int] [math]::Min(255, $t[2])
        if ($clamped -ge 2) {
            Write-Host ("     {0,-26} repaint, not a shade - unreachable by a tint" -f $_.BaseName) -ForegroundColor DarkGray
        } else {
            Write-Host ("     {0,-26} {1}" -f $_.BaseName, $tint) -ForegroundColor Green
            $usable.Add(("{0,-26} {1}" -f $_.BaseName, $tint))
        }
    }
}

Write-Host ''
Write-Host "$($usable.Count) coats of 78 are reachable as a tint:" -ForegroundColor Cyan
$usable | ForEach-Object { Write-Host "  $_" }
