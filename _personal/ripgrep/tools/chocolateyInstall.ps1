$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/12.0.1/ripgrep-12.0.1-i686-pc-windows-msvc.zip'
$checksum32 = '8f25fca0c0508ceae8c8d4d427b1ce2c3de4921a1b588261e79ae1f5a30389a4'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/12.0.1/ripgrep-12.0.1-x86_64-pc-windows-msvc.zip'
$checksum64 = 'f44d178f37cfb1edb28fa1fffbf203ef64db8470175ae29489720ac2d17bccf0'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
