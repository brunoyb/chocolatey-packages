﻿$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep-12.1.1-i686-pc-windows-msvc.zip'
$checksum32 = '0256451a21cf5cf88dcd1823ffd2acd5e89d6b5dc9c2c8ad1324fd0e1f9ff61e'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep-12.1.1-x86_64-pc-windows-msvc.zip'
$checksum64 = 'a74d23c8c52a7cfddab029e3217cd7aad49e970ab3ee45fa72fa5f5536230088'
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
