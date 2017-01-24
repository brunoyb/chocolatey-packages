$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.5.5/mongochef-x86.msi.zip'
$checksum = 'f2561028291589339e1499bb1e0d8f98685c5cd598593db8c8c793273b248a27'
$checksumType = 'sha256'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.5.5/mongochef-x64.msi.zip'
$checksum64 = '616b83f14cd016ceb1946efc339970531982e58bc124ae8c382cb6a21b3ddc2a'
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
