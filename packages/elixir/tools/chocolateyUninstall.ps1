$packageName = 'elixir'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$machine_key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment'

$oldPath = $(Get-ItemProperty -Path $machine_key).Path
$newPath = Split-String -Input $oldPath -Separator ';' | ? { !$_.Equals("$(Join-Path $toolsDir 'bin')") } | Join-String -Separator ';'

Install-ChocolateyEnvironmentVariable 'Path' $newPath 'Machine'
