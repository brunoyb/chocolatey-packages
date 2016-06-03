$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef/windows/3.6.0/mongochef-x86.msi.zip'
$checksum = 'a0ce9682b9ac983786974a0b2c720a38ee5507a0'
$checksumType = 'sha1'
$url64 = 'https://cdn.3t.io/mongochef/windows/3.6.0/mongochef-x64.msi.zip'
$checksum64 = '0e2ade6965558f35a0cccc5fbece9cd652e576fe'
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
