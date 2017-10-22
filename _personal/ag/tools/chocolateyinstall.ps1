$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-08-31/2.1.0-1/ag-2017-08-31_2.1.0-1-x86.zip'
$checksum32 = '28456a424a30b12be3be2b9d427bc67031bc436f87f1100607cfa9a44c1af95d'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-08-31/2.1.0-1/ag-2017-08-31_2.1.0-1-x64.zip'
$checksum64 = '2f0b83e705d6224df82be92014726875bec925c6b56ef84170d1f19eddfaa439'
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
