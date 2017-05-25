$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.3.0/studio-3t-x86.msi.zip'
$checksum32 = '3a406499e82f57590fca466f86e352dcd3621249669a5011f7bc2e855879450c'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.3.0/studio-3t-x64.msi.zip'
$checksum64 = 'e4881bba58522f45cb1b86810e187f73f39749b10b1eb4b4b1175da47f634300'
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
