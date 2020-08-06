$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v2.3.3/stack-2.3.3-windows-x86_64.zip'
$checksum64 = 'fb14dfea14cc0562a2e7c78f2c92be0f7b6119f1b3c2265f5e623b7149309802'
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
