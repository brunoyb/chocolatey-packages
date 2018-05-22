$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\Uninstall-ChocolateyPath.ps1

Start-ChocolateyProcessAsAdmin -Statements '-nsis' `
                               -ExeToRun "$(Join-Path $toolsDir 'vim\vim81\uninstal.exe')"

Uninstall-ChocolateyPath "$(Join-Path $toolsDir 'vim\vim81')" 'Machine'
