$ErrorActionPreference = 'Stop'

$packageName = 'phraseapp'
$url64 = 'https://github.com/phrase/phraseapp-client/releases/download/1.4.5/phraseapp_windows_amd64.exe.zip'
$checksum64 = 'c320c6cd35e368462d928ed08468d8c5e667f55b8f8fd754d39e91e22a3fbdc2'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

Move-Item -Force "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')"
