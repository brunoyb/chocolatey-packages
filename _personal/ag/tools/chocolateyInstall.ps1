$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-06-08/2.1.0-38-g9163065/ag-2018-06-08_2.1.0-38-g9163065-x86.zip'
$checksum32 = '458e835b49296ddb48999a706cad6005fc7c8fd6e28105d5283fa97321435311'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-06-08/2.1.0-38-g9163065/ag-2018-06-08_2.1.0-38-g9163065-x64.zip'
$checksum64 = '478fbbd0706044c38b55f560458a8d09e6b15373e23b2f5744fb1757bbf87ee3'
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
