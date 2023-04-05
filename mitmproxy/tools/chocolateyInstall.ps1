$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url64 = 'https://snapshots.mitmproxy.org/9.0.1/mitmproxy-9.0.1-windows-x64-installer.exe'
$checksum64 = '44e8df16b77135e674615ff0b60826e7293f329f5940bb942db96700c8d9d8cf'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64
