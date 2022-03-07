$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v2.7.5/stack-2.7.5-windows-x86_64.zip'
$checksum64 = 'a77a1b27501d78800baa7e88d8ccca1d6e9b19b9c59f02f2a40ca260aaa75260'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageParameters = Get-PackageParameters

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

if ($packageParameters.NoLocalBinOnPath -ne $true) {
	Install-ChocolateyPath "$(Join-Path $env:APPDATA 'local\bin')" 'User'
}

if ($packageParameters.NoStackRoot -ne $true) {
	Install-ChocolateyEnvironmentVariable 'STACK_ROOT' "$(Join-Path $env:SystemDrive 'sr')" 'User'
}
