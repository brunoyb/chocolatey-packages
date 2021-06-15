$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url32 = 'https://www.fossil-scm.org/home/uv/fossil-w32-2.15.2.zip'
$checksum32 = 'f12dc52d3b460c771a5fb6bf1eab8db4e31fd39d6a5e98dc4ccbe47a7b060600'
$checksumType32 = 'sha256'
$url64 = 'https://www.fossil-scm.org/home/uv/fossil-w64-2.15.2.zip'
$checksum64 = '7a6c3075c6a88b145a7b804120b96c9e056dcdef5f4f14b251bd725e4aad902c'
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
