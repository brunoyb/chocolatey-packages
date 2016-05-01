$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef/windows/3.5.1/mongochef-x86.msi.zip'
$checksum = '0fa152be66df07ce9e9f341b2123c41f44aef36c'
$checksumType = 'sha1'
$url64 = 'https://cdn.3t.io/mongochef/windows/3.5.1/mongochef-x64.msi.zip'
$checksum64 = '54b1e85f2987ccf5db0d277594900f34c07d31f5'
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
