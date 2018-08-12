$ErrorActionPreference = 'Stop'

$packageName = 'ripgrep'
$url32 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep-0.9.0-i686-pc-windows-msvc.zip'
$checksum32 = '9e1278e0067e9a34e9711ad0bb7cd25aa1a6feadfe90a6ab175525be8b9f4f3c'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep-0.9.0-x86_64-pc-windows-msvc.zip'
$checksum64 = 'de9a487fdf1871182802a450412fca48ce11ecf72def7f97cc9d0a9b069b891f'
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
