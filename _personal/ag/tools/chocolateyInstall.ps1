$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-01-25/2.1.0-28-g4aa9f05/ag-2018-01-25_2.1.0-28-g4aa9f05-x86.zip'
$checksum32 = 'd65b157dbd5f004151653507826915673106c9679d386bf18ec13cf97344c96d'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-01-25/2.1.0-28-g4aa9f05/ag-2018-01-25_2.1.0-28-g4aa9f05-x64.zip'
$checksum64 = 'e287fcba7d01142fd79fd4d8a8244fc0023bf9225869d3c9bde83691b4d327cb'
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
