$packageName = 'studio3t'
$url = 'https://download.studio3t.com/studio-3t/windows/5.1.0/studio-3t-x86.msi.zip'
$checksum = '3fe6bc542cd10eb7bb9491f8068aabe8a01b128d1797eff1c198847cf42ab57f'
$checksumType = 'sha256'
$url64 = 'https://download.studio3t.com/studio-3t/windows/5.1.0/studio-3t-x64.msi.zip'
$checksum64 = '73b1ebb110d0e1aa7503f08bd69eb5f0bd62dc569137964b330aab7c353e824c'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
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
