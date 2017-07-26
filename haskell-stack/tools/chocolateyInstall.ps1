$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url32 = 'https://github.com/commercialhaskell/stack/releases/download/v1.5.0/stack-1.5.0-windows-i386.zip'
$checksum32 = 'afb056535477907c0a38503b131f6fd213d357fee9ad80758370574185f86ce4'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.5.0/stack-1.5.0-windows-x86_64.zip'
$checksum64 = '69e9dc289e1fb8a8ccfb20fcc0d5df7f4037eeef2737b0c2a527ab3c81d8afe4'
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
