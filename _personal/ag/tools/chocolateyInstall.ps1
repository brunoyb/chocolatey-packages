$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-11-27/2.2.0-4-g1b06a9f/ag-2018-11-27_2.2.0-4-g1b06a9f-x86.zip'
$checksum32 = 'dff7b4682d88b240d9fbe38d5bc331f851b27f167947a0e7b663f75332099a06'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-11-27/2.2.0-4-g1b06a9f/ag-2018-11-27_2.2.0-4-g1b06a9f-x64.zip'
$checksum64 = '3752f812888c5694bd93a4fd3504247c4ed22ba54105cbc5024006ea5f1d1678'
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
