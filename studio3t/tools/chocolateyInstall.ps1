$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.3.2/studio-3t-x86.msi.zip'
$checksum32 = '407d01433e0e7079995e4d6ec730b69a1b2c3dd896373a175e6f22d798ef2767'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.3.2/studio-3t-x64.msi.zip'
$checksum64 = '1027688fef4ece2edd02c22536ff8f771725df5eea5939c3af78fb26a3f9df49'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
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
