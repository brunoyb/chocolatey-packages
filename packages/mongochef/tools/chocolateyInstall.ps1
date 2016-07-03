$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.0.3/mongochef-x86.msi.zip'
$checksum = '432e70f34aebd864c3287f738f0ae4500a23a9a2'
$checksumType = 'sha1'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.0.3/mongochef-x64.msi.zip'
$checksum64 = 'edafa65807c3c5f787de16de101a1ec4ed0b97ea'
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
