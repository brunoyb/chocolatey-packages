$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v2.5.1/stack-2.5.1-windows-x86_64.zip'
$checksum64 = '925fcc22e8f40465d2f6a5f9e23a49178d650bd8c6caa3d820c80258a8232a8b'
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
