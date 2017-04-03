$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.1.1/studio-3t-x86.msi.zip'
$checksum32 = '1ba91f3200ce72d47bbef5b4d238761c0d92623e1b8598609e8e27b84dece666'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.1.1/studio-3t-x64.msi.zip'
$checksum64 = '546a0427bd06fd6c8b8b4dbec4151492629047fd668bb6a5bd06c9a8cb88745a'
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
