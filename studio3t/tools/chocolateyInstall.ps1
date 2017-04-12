$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.2.1/studio-3t-x86.msi.zip'
$checksum32 = '55eadbf12e93d5394bf08d60d0d1202d7c7b41d93f56695e50e4f050d161736a'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.2.1/studio-3t-x64.msi.zip'
$checksum64 = 'd7bcdab61001ce8b9950600e0f99fad7361b71e6d45cce1b8ddfb5ec77e9fae2'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
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
