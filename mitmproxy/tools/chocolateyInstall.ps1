$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url64 = 'https://downloads.mitmproxy.org/10.4.0/mitmproxy-10.4.0-windows-x86_64-installer.exe'
$checksum64 = '8d5bf83e0bf018c9b3dc7428a1c554ed02c8611a28ef8b9d093213645a4439d4'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64
