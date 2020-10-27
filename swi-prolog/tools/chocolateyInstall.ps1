$ErrorActionPreference = 'Stop'

$packageName = 'swi-prolog'
$fileType = 'exe'
$silentArgs = '/S'
$url32 = 'http://www.swi-prolog.org/download/stable/bin/swipl-8.2.2-1.x86.exe'
$checksum32 = 'bce1ca88aa756e1126a5a781f16f6f0e8d397d1230b8d8b1fb75e1cee8e9ddde'
$checksumType32 = 'sha256'
$url64 = 'http://www.swi-prolog.org/download/stable/bin/swipl-8.2.2-1.x64.exe'
$checksum64 = '0ab406968640118b163c23a25cbd75b145f30df38a6722d53f0ba415b2005228'
$checksumType64 = 'sha256'

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url32 `
                          -Checksum $checksum32 `
                          -ChecksumType $checksumType32 `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64

$swiplExeDir = Get-AppInstallLocation swipl

if ($swiplExeDir) {
	Install-ChocolateyPath "$(Join-Path $swiplExeDir 'bin')" 'Machine'
}
