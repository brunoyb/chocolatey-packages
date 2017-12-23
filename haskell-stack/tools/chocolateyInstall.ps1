$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url32 = 'https://github.com/commercialhaskell/stack/releases/download/v1.6.3/stack-1.6.3-windows-i386.zip'
$checksum32 = '8ab7bdfd730bda38bd7a04b893ef04237340b475bb235f87494ba60da3bf4bcc'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.6.3/stack-1.6.3-windows-x86_64.zip'
$checksum64 = '461b3653496340b09dacaee6bdbf696a3d676e73031ace8e53cdc2479468301b'
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

if ($packageParameters.NoLocalBinOnPath -NE $true) {
	Install-ChocolateyPath "$(Join-Path $env:APPDATA 'local\bin')" 'User'
}

if ($packageParameters.NoStackRoot -NE $true) {
	Install-ChocolateyEnvironmentVariable 'STACK_ROOT' "$(Join-Path $env:SystemDrive 'sr')" 'User'
}
