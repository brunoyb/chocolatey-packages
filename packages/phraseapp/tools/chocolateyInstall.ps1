$packageName = 'phraseapp'
$url = 'https://github.com/phrase/phraseapp-client/releases/download/1.2.3/phraseapp_windows_amd64.exe.zip'
$checksum = 'c5d5672350da4cb503ab2318cac2dfb467133f12fd158f157bf88b9e62427125'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Move-Item "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')" -Force
