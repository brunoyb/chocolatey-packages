$packageName = 'mongochef'
$url = 'https://cdn.3t.io/mongochef-core/windows/4.1.1/mongochef-x86.msi.zip'
$checksum = '94a6ca505892215df12d9e39148b913ea919c4815a12b1bf1f13b1e47e705485'
$checksumType = 'sha256'
$url64 = 'https://cdn.3t.io/mongochef-core/windows/4.1.1/mongochef-x64.msi.zip'
$checksum64 = '9990a64912db27fe6eb7945c5e2fb220220c08d3bf98510fae212b0c77bfee51'
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
