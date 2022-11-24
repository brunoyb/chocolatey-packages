$ErrorActionPreference = 'Stop'

$packageName = 'swi-prolog'
$fileType = 'exe'
$silentArgs = '/S'
$url32 = 'http://www.swi-prolog.org/download/stable/bin/swipl-9.0.0-1.x86.exe'
$checksum32 = 'e58a4b26f1abdbb46cf56b267e734671aa7b780df93d0d965b7fc07125b3d80f'
$checksumType32 = 'sha256'
$url64 = 'http://www.swi-prolog.org/download/stable/bin/swipl-9.0.0-1.x64.exe'
$checksum64 = '195e249759cf12fc1fd8330e25a83f4701c3d5937ed3c09022da4ef75633adcf'
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
