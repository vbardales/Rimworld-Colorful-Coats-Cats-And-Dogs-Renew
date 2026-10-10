<#
.SYNOPSIS
  Validate injected PawnKindDef fields against the installed game's types.
.DESCRIPTION
  The shared field checker only reads Defs documents, not Patch documents.
  Extract each shipped value into a temporary PawnKindDef so nested fields,
  including AlternateGraphic fields, are checked without modifying the mod.
#>
[CmdletBinding()]
param(
    [string] $FieldChecker = '',
    [string] $Managed = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld\RimWorldWin64_Data\Managed'
)
$ErrorActionPreference = 'Stop'
if (-not $FieldChecker) { $FieldChecker = Join-Path $PSScriptRoot '..\..\scripts\Check-XmlFields.ps1' }
if (-not (Test-Path $FieldChecker)) { throw "Shared checker missing: $FieldChecker. Supply -FieldChecker." }
$scratch = Join-Path $env:TEMP ('coats-fields-' + [guid]::NewGuid().ToString('N'))
[void] (New-Item -ItemType Directory -Path $scratch)
try {
    $defs = New-Object System.Xml.XmlDocument
    $defs.LoadXml('<Defs/>')
    $count = 0
    foreach ($file in Get-ChildItem (Join-Path $PSScriptRoot '..\Mod\Patches') -Filter '*.xml') {
        [xml] $patch = Get-Content $file.FullName -Raw -Encoding UTF8
        foreach ($value in $patch.SelectNodes('/Patch/Operation/nomatch/value')) {
            $kind = $defs.CreateElement('PawnKindDef')
            foreach ($child in $value.ChildNodes) {
                [void] $kind.AppendChild($defs.ImportNode($child, $true))
            }
            [void] $defs.DocumentElement.AppendChild($kind)
            $count++
        }
    }
    if ($count -ne 41) { throw "Expected 41 patch payloads; extracted $count." }
    $defs.Save((Join-Path $scratch 'InjectedFields.xml'))
    Write-Host "Checking fields in $count shipped patch payloads."
    & powershell -NoProfile -ExecutionPolicy Bypass -File $FieldChecker -ModPath $scratch -Managed $Managed
    $result = $LASTEXITCODE
} finally {
    # Delete only the file and empty directory created by this invocation.
    $payload = Join-Path $scratch 'InjectedFields.xml'
    if (Test-Path $payload) { Remove-Item -LiteralPath $payload }
    Remove-Item -LiteralPath $scratch
}
exit $result
