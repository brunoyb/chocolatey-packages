$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url32 = 'https://www.fossil-scm.org/home/uv/fossil-w32-2.16.zip'
$checksum32 = 'eaa99a2d633620a9186c71e486d95345f41189bd882004c6dbf97bb3015399ad'
$checksumType32 = 'sha256'
$url64 = 'https://www.fossil-scm.org/home/uv/fossil-w64-2.16.zip'
$checksum64 = 'c97ca3e4d3a41751f643fa68b608632a07f4c6798f34c7b938746f0405d6fd51'
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
