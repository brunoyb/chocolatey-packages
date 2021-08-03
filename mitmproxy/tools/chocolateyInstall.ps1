$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url = 'https://snapshots.mitmproxy.org/7.0.1/mitmproxy-7.0.1-windows-installer.exe'
$checksum = '8e27d0bb814b2805956aaa60259fc9f9bc258109a9c401c20f93727646536d0b'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType
