$ErrorActionPreference = 'Stop'

$packageName = 'fossil'
$url = 'https://www.fossil-scm.org/index.html/uv/fossil-w32-2.6.zip'
$checksum = '8911c87f06cfe7c9d43825e79c8331ac31723434df62dc1d53d7ba5d6ca15edc'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir
