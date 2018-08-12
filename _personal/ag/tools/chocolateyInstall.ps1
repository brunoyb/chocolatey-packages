$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url32 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-08-08/2.2.0-2-gbd82cd3/ag-2018-08-08_2.2.0-2-gbd82cd3-x86.zip'
$checksum32 = 'a5a89f638f6e9613e7c5eca9a48772de91cb94727eb905ce054d6f16d9c62f17'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2018-08-08/2.2.0-2-gbd82cd3/ag-2018-08-08_2.2.0-2-gbd82cd3-x64.zip'
$checksum64 = 'c46ee0c94595f666bc49e02ab95bbc78a22dce1a6ea4e4c42a1ccbf233b21967'
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
