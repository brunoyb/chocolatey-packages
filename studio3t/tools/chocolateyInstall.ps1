$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.3.0/studio-3t-x86.msi.zip'
$checksum32 = '9ec6af922803505f2c3a36bfb4a1595c209fd74b6418dd0411bed5ec3e3f745e'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.3.0/studio-3t-x64.msi.zip'
$checksum64 = '2f2f48a5db820a9dc48ce53baaeaa31b3d0c005b9579f76cdde5b6ef1f13edc7'
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
