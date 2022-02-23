$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url32 = 'https://www.fossil-scm.org/home/uv/fossil-w32-2.18.zip'
$checksum32 = 'fcace550a6fa0cd3e1280ac65f9b4407b7e9a380db6cddfca09b1602b9975d6c'
$checksumType32 = 'sha256'
$url64 = 'https://www.fossil-scm.org/home/uv/fossil-w64-2.18.zip'
$checksum64 = 'b05e8cf3fb23636fec4f2f200675a16679ab045db8da828cb9448ec8e1af99ce'
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
