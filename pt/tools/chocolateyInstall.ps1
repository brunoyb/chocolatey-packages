$ErrorActionPreference = 'Stop'

$packageName = 'pt'
$url32 = 'https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.1.6/pt_windows_386.zip'
$checksum32 = 'e9ebd094e6b837d0a6b2bcead377f9321e62db990b6386b8a7921e94fede3c22'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.1.6/pt_windows_amd64.zip'
$checksum64 = 'c0916da58860e509932f6e8558a90e39038e4fe3665c83319a43fd83e37ad7b0'
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
