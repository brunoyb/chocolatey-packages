$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url = 'https://www.fossil-scm.org/index.html/uv/fossil-w32-2.9.zip'
$checksum = '992611c17f9a7010f41a98d7140abf0797d78c5631ac2b2ae5ca6b3600d459be'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir
