$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.3.0/mongochef-x86.msi.zip'
$checksum = 'c7805c58791ff99f461019a8ca770b5cfb7851d535eac40fa150adec7d7f1dc1'
$checksumType = 'sha256'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.3.0/mongochef-x64.msi.zip'
$checksum64 = 'd13a3fe7d4182a82b9823c5350919a70a7d4268ac73da4bc2a40250a614f27a2'
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
