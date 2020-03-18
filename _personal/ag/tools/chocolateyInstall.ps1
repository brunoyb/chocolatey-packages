$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2020-02-26/2.2.0-24-gb93c271/ag-2020-02-26_2.2.0-24-gb93c271-x86.zip'
$checksum32 = '68624e20b13f2e3401c6cdc188df849047faeceba1c9b643342e4c2cc784206c'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2020-02-26/2.2.0-24-gb93c271/ag-2020-02-26_2.2.0-24-gb93c271-x64.zip'
$checksum64 = 'b00831313106ff6ae90691f2971afc40219361ae889303d6c3e6fac66a2ea335'
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
