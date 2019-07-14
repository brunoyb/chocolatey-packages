$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url32 = 'https://github.com/commercialhaskell/stack/releases/download/v2.1.3/stack-2.1.3-windows-i386.zip'
$checksum32 = '8977ff6d7b0e6899bd29b6d7425b2bf4538753d3bc243e1be04e6fdb5e546707'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v2.1.3/stack-2.1.3-windows-x86_64.zip'
$checksum64 = '5c1c6fb52e2c107d7140c58ff218d5992a4ad5dd903dbbf399ebbfcb68a5c57f'
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
