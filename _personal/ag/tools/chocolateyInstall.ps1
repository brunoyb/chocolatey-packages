$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2019-03-23/2.2.0-19-g965f71d/ag-2019-03-23_2.2.0-19-g965f71d-x86.zip'
$checksum32 = '26f4bdb3c47aa3bc3adf0b0fb529304facba0e923ef39dfbef714a1ea934577e'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2019-03-23/2.2.0-19-g965f71d/ag-2019-03-23_2.2.0-19-g965f71d-x64.zip'
$checksum64 = 'e4f39c0bb6d79a23b8d4acdeb2cc1e4195c3e6e34a649d91c6dfdbff917d3418'
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
