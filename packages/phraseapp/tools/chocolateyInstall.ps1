$packageName = 'phraseapp'
$url = 'https://github.com/phrase/phraseapp-client/releases/download/1.2.0/phraseapp_windows_amd64.exe.zip'
$checksum = '3c15b03377b4796d3d524ddee49adefa9deb11354e9e7f6aefff039db007c490'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Move-Item "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')" -Force
