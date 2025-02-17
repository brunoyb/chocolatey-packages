$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url64 = 'https://downloads.mitmproxy.org/11.1.3/mitmproxy-11.1.3-windows-x86_64-installer.exe'
$checksum64 = '526e9f0027b9017411331e9c084dd01e2da04c9a28bee7abeb83b493ab39cc19'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64
