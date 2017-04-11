$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.2.0/studio-3t-x86.msi.zip'
$checksum32 = 'c4d833da1547d6911394d929911876ef8cb75b91f6b72c4632bf0aff4c295180'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.2.0/studio-3t-x64.msi.zip'
$checksum64 = 'd6aa18a5ebbe88625dd7bad4a344647560e5dc5a782818a7e448a819e99e37a2'
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
