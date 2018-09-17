$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-i686-pc-windows-msvc.zip'
$checksum32 = '0deee9dfba44c9fb3dce69cc341513d58375c2842dcbdb3f2c5ca800b29093b3'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-pc-windows-msvc.zip'
$checksum64 = '6d3e9972627e88c3bf4aa6d0d5383326bd8f787510df6b0b7374a50570eb5570'
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
