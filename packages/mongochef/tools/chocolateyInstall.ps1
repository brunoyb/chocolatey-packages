$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.2.0/mongochef-x86.msi.zip'
$checksum = 'f1515af30ff88bacf203af6d09e709adfb0dfb08cbea3659b5fb5573a2c07cd3'
$checksumType = 'sha256'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.2.0/mongochef-x64.msi.zip'
$checksum64 = '3cd2faf5eebc69943beecdb3b66b29317f47c5a1fb897e9ed40757f5852895cb'
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
