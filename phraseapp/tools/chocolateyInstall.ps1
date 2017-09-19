$ErrorActionPreference = 'Stop'

$packageName = 'phraseapp'
$url64 = 'https://github.com/phrase/phraseapp-client/releases/download/1.5.0/phraseapp_windows_amd64.exe.zip'
$checksum64 = 'ba8bd869d00ee13d2c3fbfe07032123f6c5722e69d1668926be54ef56296d2b2'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

Move-Item -Force "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')"
