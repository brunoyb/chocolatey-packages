$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep-11.0.2-i686-pc-windows-msvc.zip'
$checksum32 = '9408d9a49abc38768377378aa70c0d6615c06bbd0fd959048e1bbb7b261c3fdd'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep-11.0.2-x86_64-pc-windows-msvc.zip'
$checksum64 = '0be0279591412e12b0b92d5fda0707ebeceb9c6a51472e99b46fd4d25f13b6ef'
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
