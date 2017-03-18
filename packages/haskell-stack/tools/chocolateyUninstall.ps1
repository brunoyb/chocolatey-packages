$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\Uninstall-ChocolateyPath.ps1

Uninstall-ChocolateyPath -PathToUninstall '%APPDATA%\local\bin' -PathType 'Machine'
Uninstall-ChocolateyEnvironmentVariable -VariableName 'STACK_ROOT' -VariableType 'Machine'
