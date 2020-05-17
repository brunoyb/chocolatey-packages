$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.0/ripgrep-12.1.0-i686-pc-windows-msvc.zip'
$checksum32 = '8dcca7ca3d498c7e36de50151f97b2c8dd2b7e216638479ecf6323624e50eeb9'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.0/ripgrep-12.1.0-x86_64-pc-windows-msvc.zip'
$checksum64 = 'd448ce19f9bfe81a1014f5a46675ef7e26253191786ec86dcdd98da11392ae3f'
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
