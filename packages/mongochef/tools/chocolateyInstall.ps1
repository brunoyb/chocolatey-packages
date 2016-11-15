$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.4.2/mongochef-x86.msi.zip'
$checksum = '5fdeca74cddf2f2ccd54eb0334ec7538355f1b8305545e54efe754a05ea64d1f'
$checksumType = 'sha256'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.4.2/mongochef-x64.msi.zip'
$checksum64 = 'baee7ce0cc2cf31f2b8f75fb4490169ec3646503d8a809a4a96b584615ef8403'
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
