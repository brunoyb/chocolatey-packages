$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url64 = 'https://downloads.mitmproxy.org/11.1.0/mitmproxy-11.1.0-windows-x86_64-installer.exe'
$checksum64 = '4996a08039ee63c1a40104eb244fd83b7cff56121439876b5322285e568fc1d5'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64
