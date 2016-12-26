$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.5.0/mongochef-x86.msi.zip'
$checksum = '3514b40d7769c4de1067821449f7aab971de28176bd7786331e2a0319222959d'
$checksumType = 'sha256'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.5.0/mongochef-x64.msi.zip'
$checksum64 = '02652e4fe633fe0e10fb7912b78482981e99b4fbf4361f4d44abe65c91ba9e57'
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
