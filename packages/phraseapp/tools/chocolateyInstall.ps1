$packageName = 'phraseapp'
$url = 'https://github.com/phrase/phraseapp-client/releases/download/1.4.3/phraseapp_windows_amd64.exe.zip'
$checksum = '48bd93b6404c3094b14fa0c7cce4ac72cbc8a301d84e9eb82c1fed50f0fc9965'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

Move-Item "$(Join-Path $toolsDir 'phraseapp_windows_amd64.exe')" "$(Join-Path $toolsDir 'phraseapp.exe')" -Force
