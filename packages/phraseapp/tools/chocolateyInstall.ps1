$packageName = 'phraseapp'
$url = 'https://github.com/phrase/phraseapp-client/releases/download/1.2.1/phraseapp_windows_amd64.exe.zip'
$checksum = '26fc1e03d5e364a0faffd213b75b770c78eed99df78dde53297c2025a1681292'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Move-Item "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')" -Force
