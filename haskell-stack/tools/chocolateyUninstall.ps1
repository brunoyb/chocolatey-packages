$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\Uninstall-ChocolateyPath.ps1

Uninstall-ChocolateyPath "$(Join-Path $env:APPDATA 'local\bin')" 'User'
Uninstall-ChocolateyEnvironmentVariable 'STACK_ROOT' 'User'
