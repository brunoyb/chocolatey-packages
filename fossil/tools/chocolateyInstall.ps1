$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url64 = 'https://www.fossil-scm.org/index.html/uv/fossil-w32-2.9.zip'
$checksum64 = '992611c17f9a7010f41a98d7140abf0797d78c5631ac2b2ae5ca6b3600d459be'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir
