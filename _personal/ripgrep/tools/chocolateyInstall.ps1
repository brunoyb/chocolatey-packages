$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-i686-pc-windows-msvc.zip'
$checksum32 = '3b2e4776f9510d2f502fea92f1be45c02ff0f46da50f034b04fe866182ffc0d6'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-x86_64-pc-windows-msvc.zip'
$checksum64 = 'fe4f75edfaa50f0d4fecbf47696b7629f3449c9c2c5a4da828753139e5a2e203'
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
