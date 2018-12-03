$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url32 = 'https://github.com/commercialhaskell/stack/releases/download/v1.9.3/stack-1.9.3-windows-i386.zip'
$checksum32 = '3d73c8a63503efc387a926a705d2cde013ebc3a991f6f62bfccc12aa62b5b8aa'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.9.3/stack-1.9.3-windows-x86_64.zip'
$checksum64 = '9ff25247ad90478bdea042df2520e7865521d9023ba8dc6eae79875e1b11fcbb'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageParameters = Get-PackageParameters

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
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
