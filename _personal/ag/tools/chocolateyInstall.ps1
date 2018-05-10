﻿$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-04-24/2.1.0-34-g5b10c68/ag-2018-04-24_2.1.0-34-g5b10c68-x86.zip'
$checksum32 = '0f3ecd3bc28fcb48fb71001ba3b0267d7587dcb2618beb2cbd26568d7d99ef99'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-04-24/2.1.0-34-g5b10c68/ag-2018-04-24_2.1.0-34-g5b10c68-x64.zip'
$checksum64 = 'd9b504031443d738beeffa6e4b9ac7162e7f76c5c11bd31ceaddfe0c0dba0d97'
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
