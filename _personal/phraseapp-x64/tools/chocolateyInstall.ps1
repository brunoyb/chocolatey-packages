$packageName = 'phraseapp-x64'
$url = 'https://github.com/phrase/phraseapp-client/releases/download/1.4.5/phraseapp_windows_amd64.exe.zip'
$checksum = 'c320c6cd35e368462d928ed08468d8c5e667f55b8f8fd754d39e91e22a3fbdc2'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Move-Item -Force "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')"
