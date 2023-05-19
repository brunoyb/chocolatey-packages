$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v2.11.1/stack-2.11.1-windows-x86_64.zip'
$checksum64 = '56a9394b3be8058206aa1efa23ea40cd8a3afbfd295432de7a81d72e86615087'
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
