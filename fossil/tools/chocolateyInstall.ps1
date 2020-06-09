$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url32 = 'https://www.fossil-scm.org/home/uv/fossil-w32-2.11.1.zip'
$checksum32 = '1e371555c9570be470249f2a9f020f7acbba5667bbc5ece71fa55d79c77ee874'
$checksumType32 = 'sha256'
$url64 = 'https://www.fossil-scm.org/home/uv/fossil-w64-2.11.1.zip'
$checksum64 = 'b43f3ef2d85a1f0de1f7bfc7b698dee5382a224aaa41ec939a18eb3868f57410'
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
