$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url = 'https://snapshots.mitmproxy.org/5.1.0/mitmproxy-5.1.0-windows-installer.exe'
$checksum = 'f48da8364071e666be50182516ac67c93a872353eb0ed1655522513428314ed0'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType
