$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.1.0/mongochef-x86.msi.zip'
$checksum = 'd5c5696110b8707df02b07a779799b7b5db5b442'
$checksumType = 'sha1'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.1.0/mongochef-x64.msi.zip'
$checksum64 = 'be00e159523cc9db45a3f999d41f259910ad1049'
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
