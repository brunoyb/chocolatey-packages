$packageName = 'phraseapp'
$url = 'https://github.com/phrase/phraseapp-client/releases/download/1.1.19/phraseapp_windows_amd64.exe.zip'
$checksum = '5c03aba6b2fcf7107e0a5711482caf403a999eba'
$checksumType = 'sha1'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Move-Item "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')" -Force
