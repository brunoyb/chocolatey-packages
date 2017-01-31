$packageName = 'haskell-stack'
$url = 'https://github.com/commercialhaskell/stack/releases/download/v1.3.2/stack-1.3.2-windows-i386.zip'
$checksum = 'fcc8bd9749c42e2811ed9f954631ae38393504ff5c9d792dfa200fe6437238ee'
$checksumType = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.3.2/stack-1.3.2-windows-x86_64.zip'
$checksum64 = 'f311f541e15aed8354722a221f61ed90aff0b4892604c9d0bc333cd3be9b3151'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageParameters = Get-PackageParameters

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

if (!$packageParameters.NoLocalBinOnPath) {
	Install-ChocolateyPath '%APPDATA%\local\bin' 'Machine'
}

if (!$packageParameters.NoStackRoot) {
	Install-ChocolateyEnvironmentVariable 'STACK_ROOT' "$(Join-Path $env:SystemDrive 'sr')" 'Machine'
}
