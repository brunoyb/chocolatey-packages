$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.5.2/ripgrep-0.5.2-i686-pc-windows-msvc.zip'
$checksum32 = 'd9c0c7bfb2dd8203be8a56c8bea1eb704ac7f2e3e813f590cc8551c1d142d43e'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.5.2/ripgrep-0.5.2-x86_64-pc-windows-msvc.zip'
$checksum64 = '377e76c4877aeef3419438b95f7a9b08060a009aec96cc2cb7707a5518a7fa98'
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
