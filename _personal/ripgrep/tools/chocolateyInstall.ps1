$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/12.0.0/ripgrep-12.0.0-i686-pc-windows-msvc.zip'
$checksum32 = 'adca09b661ea76b8cf51c8ebd4adf6bd831303a41fcc7dc9320fb405b69f025b'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/12.0.0/ripgrep-12.0.0-x86_64-pc-windows-msvc.zip'
$checksum64 = '4909fd1624a17eb4918334821bfb73ce52bd7448ad5e0e6f6a17605031f6c5d5'
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
