$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.5.2/mongochef-x86.msi.zip'
$checksum = '590f3bc5e935e8251f7389429975fc415d7b12ff72f359495b6e64dcf0874d48'
$checksumType = 'sha256'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.5.2/mongochef-x64.msi.zip'
$checksum64 = 'e567871059f1d5eda74ae33c03c3140c6e9d009655644fd1e21f249ec5d9e2a5'
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
