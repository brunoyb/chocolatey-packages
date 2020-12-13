$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url = 'https://snapshots.mitmproxy.org/6.0.0/mitmproxy-6.0.0-windows-installer.exe'
$checksum = '246e5799a8d03cce2126b3e515a8a39eb6e6db0c358b78b2f09204e0ebe1db9d'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType
