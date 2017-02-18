$packageName = 'studio3t'
$url = 'https://download.studio3t.com/studio-3t/windows/5.0.1/studio-3t-x86.msi.zip'
$checksum = '5420c57bbebbafd344f12edd35cdb47a4631ef65b8f173a6abfc4bf0cda4ffd0'
$checksumType = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.0.1/studio-3t-x64.msi.zip'
$checksum64 = 'f11199a2df40124a2572bfcd0f0d643911fe7fbb0519c6c901769a321e32e40b'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

$fileType = 'msi'
$silentArgs = '/quiet'
$file = Get-ChildItem $toolsDir -Include *.msi -Recurse | Select -First 1

Install-ChocolateyInstallPackage -PackageName $packageName `
                                 -FileType $fileType `
                                 -SilentArgs $silentArgs `
                                 -File $file

Remove-Item $file
