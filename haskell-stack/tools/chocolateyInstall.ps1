$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url32 = 'https://github.com/commercialhaskell/stack/releases/download/v2.1.1/stack-2.1.1-windows-i386.zip'
$checksum32 = '19e5920a7958c2aceb67657948e67130d615b92f9f95678c19a9fa26a6107a69'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v2.1.1/stack-2.1.1-windows-x86_64.zip'
$checksum64 = 'e29e816e6fe4e360f702303791f0cba40f0e61a6a8daa1ef33ca7b763becf948'
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
