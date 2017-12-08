$ErrorActionPreference = 'Stop'

$packageName = 'studio3t'
$url32 = 'https://download.studio3t.com/studio-3t/windows/5.7.1/studio-3t-x86-no-shell.zip'
$checksum32 = '80613dc27c41e12431be1394873d3e75807a0c48922ae550314bd7024eec9a40'
$checksumType32 = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.7.1/studio-3t-x64.zip'
$checksum64 = 'd27a0a067e692931ff761c3ca01039c7da46614414b7455efc5a8fe13b1b426f'
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
