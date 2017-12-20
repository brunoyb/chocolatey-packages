$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.7.2/studio-3t-x86-no-shell.zip'
$checksum32 = 'b6a9cd3301bc02ad636303cb3d5192695788717533654ea26fece13c8f093723'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.7.2/studio-3t-x64.zip'
$checksum64 = 'cc47fd7bb3783f79bbbb1446dcf29c8d7e1f0bc2c3fc96e323c77e4cb7eca187'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

. "$toolsDir\helpers.ps1"

Uninstall-OutdatedVersionIfApplicable

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

$fileType = 'exe'
$silentArgs = '-q'
$file = Get-ChildItem $toolsDir -Include *.exe -Recurse | Select-Object -First 1

Install-ChocolateyInstallPackage -PackageName $packageName `
                                 -FileType $fileType `
                                 -SilentArgs $silentArgs `
                                 -File $file

Remove-ItemRetrying $file
