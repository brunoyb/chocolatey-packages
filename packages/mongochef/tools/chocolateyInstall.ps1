$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef/windows/3.5.2/mongochef-x86.msi.zip'
$checksum = '3d9df4649b1262ba27b141dcec0cba5132bbdb7c'
$checksumType = 'sha1'
$url64 = 'https://cdn.3t.io/mongochef/windows/3.5.2/mongochef-x64.msi.zip'
$checksum64 = 'aad33a250e7952b2926ece2a91f63d684683fe5b'
$checksumType64 = 'sha1'
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
