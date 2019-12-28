$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url = 'https://snapshots.mitmproxy.org/5.0.1/mitmproxy-5.0.1-windows-installer.exe'
$checksum = 'f7513949e277ad2a58f61012c401fe5a01e91eefa6eebfd43182fa6deedc241b'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType
