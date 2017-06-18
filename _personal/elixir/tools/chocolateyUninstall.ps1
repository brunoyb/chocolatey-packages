$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\Uninstall-ChocolateyPath.ps1

Uninstall-ChocolateyPath "$(Join-Path $toolsDir 'bin')" 'Machine'
