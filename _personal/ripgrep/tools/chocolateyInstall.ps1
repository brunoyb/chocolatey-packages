$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep-0.8.1-i686-pc-windows-msvc.zip'
$checksum32 = 'b9b25159675f8419089332c27d25dd9b810633aaf634c40f7fd3d334839aaa0c'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep-0.8.1-x86_64-pc-windows-msvc.zip'
$checksum64 = 'f0304442cbfeee9992bcf9f13e205660aa26f711d1591808f7f0383d605ebb78'
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
