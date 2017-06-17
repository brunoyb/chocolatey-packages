$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\Uninstall-ChocolateyPath.ps1

Uninstall-ChocolateyPath '%APPDATA%\local\bin' 'Machine'
Uninstall-ChocolateyEnvironmentVariable 'STACK_ROOT' 'Machine'
