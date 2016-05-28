$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef/windows/3.5.3/mongochef-x86.msi.zip'
$checksum = '36152c0f742493afdb37ccddc37036601f5ea4e2'
$checksumType = 'sha1'
$url64 = 'https://cdn.3t.io/mongochef/windows/3.5.3/mongochef-x64.msi.zip'
$checksum64 = 'cc87751197a3e816144be5eaa27a2090d7130140'
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
