$ErrorActionPreference = 'Stop'

$packageName = 'phraseapp'
$url64 = 'https://github.com/phrase/phraseapp-client/releases/download/1.16.1/phraseapp_windows_amd64.exe.zip'
$checksum64 = '7567432a234901420aa11106014fc1be4cd9ba379ccd7d5424553c93ea9bda61'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

Move-Item -Force "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')"
