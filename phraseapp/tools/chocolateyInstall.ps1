$ErrorActionPreference = 'Stop'

$packageName = 'phraseapp'
$url64 = 'https://github.com/phrase/phraseapp-client/releases/download/2.0.0/phraseapp_windows_amd64.exe.zip'
$checksum64 = 'b960977056daa79fe8d498707bd0aa0ed007b0a54a88802d07f05ea9d754e75a'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

Move-Item -Force "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')"
