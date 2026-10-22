$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url64 = 'https://downloads.mitmproxy.org/12.3.0/mitmproxy-12.3.0-windows-x86_64-installer.exe'
$checksum64 = '641c0b8f88643c2f6cc8387f1cbb720afcf82e3b72878c24d693dda78da7d5b1'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64
