$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.3.1/studio-3t-x86.msi.zip'
$checksum32 = 'e1c616e6fed542585ddd4658e8a983db13d7c08a933ce896ccacc0330b0806ff'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.3.1/studio-3t-x64.msi.zip'
$checksum64 = '23b5af610bcdec43bef24c3064aea1ab3d15f9b229bc4b31aea859874ac18c4a'
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
