$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.2.2/studio-3t-x86.msi.zip'
$checksum32 = 'a7328c178418b700376f60ce54775bcbbac26720c3f7a0d408060a2b01ee481c'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.2.2/studio-3t-x64.msi.zip'
$checksum64 = '75b5bfbdd7f8ca13078c3ddb7cabef3eca5b806d4c0a9f006c480bf74de4617d'
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
