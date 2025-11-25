$ErrorActionPreference = 'Stop'

$packageName = 'mitmproxy'
$fileType = 'exe'
$silentArgs = '--mode unattended'
$url64 = 'https://downloads.mitmproxy.org/12.2.1/mitmproxy-12.2.1-windows-x86_64-installer.exe'
$checksum64 = 'c3470c6ca4322dd89cfbfca97acdb92e38f79c52d9e54820046df7f80195ed22'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64
