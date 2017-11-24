$ErrorActionPreference = 'Stop'

$packageName = 'phraseapp'
$url64 = 'https://github.com/phrase/phraseapp-client/releases/download/1.6.0/phraseapp_windows_amd64.exe.zip'
$checksum64 = '6fa11d52e1f0cfab15ecf093014f9a4c9d43f812a72997dbde0e548f2a14fc75'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

Move-Item -Force "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')"
