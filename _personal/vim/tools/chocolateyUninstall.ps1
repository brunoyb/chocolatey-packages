$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$installDir = Get-ToolsLocation

. $toolsDir\helpers.ps1
. $toolsDir\Uninstall-ChocolateyPath.ps1

$vimExeDir = Get-VimExeDir $installDir

Start-ChocolateyProcessAsAdmin -Statements '-nsis' `
                               -ExeToRun "$(Join-Path $vimExeDir 'uninstal.exe')"

Stop-Process -ProcessName explorer
Sleep 5

Remove-Item -Recurse -Force "$(Join-Path $installDir 'vim')"

Uninstall-ChocolateyPath $vimExeDir 'Machine'
