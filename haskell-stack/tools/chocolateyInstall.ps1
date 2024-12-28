$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v3.3.1/stack-3.3.1-windows-x86_64.zip'
$checksum64 = '138251d1f03d6dd4170e1886ca0a4498166067f840ffcd555fb4204c223f8466'
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
