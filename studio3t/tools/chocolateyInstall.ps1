$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.7.4/studio-3t-x86-no-shell.zip'
$checksum32 = '134d666982a2c4350468ae6e160c211a38354b1318a9bf4ac90069af414990eb'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.7.4/studio-3t-x64.zip'
$checksum64 = 'a02ebaa23db84b22eea5f26145f504365fd73f280e3e7efa6ca582d2dde2b46b'
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
