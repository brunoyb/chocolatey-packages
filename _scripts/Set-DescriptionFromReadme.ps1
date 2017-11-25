<#
.SYNOPSIS
  Updates nuspec file description from README.md

.DESCRIPTION
  This script should be called in au_AfterUpdate to put the text in the README.md
  into description tag of the Nuspec file. The current description will be replaced.
  Function will throw an error if README.md is not found.

.PARAMETER SkipFirst
  Number of start lines to skip from the README.md, by default 0.

.PARAMETER SkipLast
  Number of end lines to skip from the README.md, by default 0.

.EXAMPLE
  function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 2 }
#>
function Set-DescriptionFromReadme([int]$SkipFirst=0, [int]$SkipLast=0) {
    if (!(Test-Path README.md)) { throw 'Set-DescriptionFromReadme: README.md not found' }

    Write-Host 'Setting README.md to Nuspec description tag'
    $description = gc README.md -Encoding UTF8
    $endIdx = $description.Length - $SkipLast
    $description = $description | select -Index ($SkipFirst..$endIdx) | Out-String

    $NuspecPath = '{0}\{1}.nuspec' -f $pwd, $Latest.PackageName
    $nu = New-Object xml
    $nu.PSBase.PreserveWhitespace = $true
    $nu.Load($NuspecPath)
    $cdata = $nu.CreateCDataSection($description)
    $xml_Description = $nu.GetElementsByTagName('description')[0]
    $xml_Description.RemoveAll()
    $xml_Description.AppendChild($cdata) | Out-Null

    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
    [System.IO.File]::WriteAllText($NuspecPath, $nu.InnerXml, $Utf8NoBomEncoding)
}
