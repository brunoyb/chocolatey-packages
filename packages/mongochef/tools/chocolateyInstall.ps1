$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.0.4/mongochef-x86.msi.zip'
$checksum = 'ab71061ad9efb65159b9212ca648156436254c74'
$checksumType = 'sha1'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.0.4/mongochef-x64.msi.zip'
$checksum64 = '1763db842283083fe385d43909b48afafcf6318d'
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
