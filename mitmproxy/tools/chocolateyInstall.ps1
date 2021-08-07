$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url = 'https://snapshots.mitmproxy.org/7.0.2/mitmproxy-7.0.2-windows-installer.exe'
$checksum = 'a5c543b02e4b60cc80f9c034b86bda07ce08f24f7124743dd806dd0e0b6e10fe'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType
