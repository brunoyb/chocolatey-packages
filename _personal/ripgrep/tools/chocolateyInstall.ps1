$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.8.0/ripgrep-0.8.0-i686-pc-windows-msvc.zip'
$checksum32 = 'e48ad9df4285e8ace26804c8985ea647d3ee3682f4279c3d42a16c419c47321e'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.8.0/ripgrep-0.8.0-x86_64-pc-windows-msvc.zip'
$checksum64 = 'db91da02074418628361995648b31fc16ef97a87def082ac285ab4e1041dc557'
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
