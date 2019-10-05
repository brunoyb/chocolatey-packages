$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url64 = 'https://www.fossil-scm.org/home/uv/fossil-w64-2.10.zip'
$checksum64 = '86c88d48fc78ae2276bb5a71dcb1657d58743a0557a5eecda8210372139b7d24'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
