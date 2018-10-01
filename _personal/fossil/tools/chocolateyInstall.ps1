$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url = 'https://www.fossil-scm.org/index.html/uv/fossil-w32-2.7.zip'
$checksum = 'd245dd626f755bfce65265e4b5a5000df15ff3e1c0f4da0838b3bbd953eb32a0'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir
