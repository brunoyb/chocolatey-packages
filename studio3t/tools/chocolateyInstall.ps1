$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/2018.2.3/studio-3t-x86-no-shell.zip'
$checksum32 = '20cb60890af3f6c2f1d7751ed0a90aadf5b5e7184f88d6e381a898ae430c95da'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/2018.2.3/studio-3t-x64.zip'
$checksum64 = 'c514a1a0212cedd67228d8431222a221c876fb88719297a3bf7d204d3980a548'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1

Uninstall-OutdatedVersion

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

$fileType = 'exe'
$silentArgs = '-q -console'
$file = Get-ChildItem $toolsDir -Include *.exe -Recurse | Select-Object -First 1

Install-ChocolateyInstallPackage -PackageName $packageName `
                                 -FileType $fileType `
                                 -SilentArgs $silentArgs `
                                 -File $file

Remove-ItemRetrying $file
