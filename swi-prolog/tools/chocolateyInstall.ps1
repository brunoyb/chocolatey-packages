$ErrorActionPreference = 'Stop'

$packageName = 'swi-prolog'
$fileType = 'exe'
$silentArgs = '/S'
$url32 = 'http://www.swi-prolog.org/download/stable/bin/swipl-8.4.0-1.x86.exe'
$checksum32 = 'c32f01520b70a232d4b672d8c0aaac62b26f4e8803cf74f8175a48353766c2a5'
$checksumType32 = 'sha256'
$url64 = 'http://www.swi-prolog.org/download/stable/bin/swipl-8.4.0-1.x64.exe'
$checksum64 = '707f0de518dba327a6776e755470e49ee39917c443b4707b30f7fe44e6b5cecb'
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
