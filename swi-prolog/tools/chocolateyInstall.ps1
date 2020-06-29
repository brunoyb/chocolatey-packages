$ErrorActionPreference = 'Stop'

$packageName = 'swi-prolog'
$fileType = 'exe'
$silentArgs = '/S'
$url32 = 'http://www.swi-prolog.org/download/stable/bin/swipl-8.2.1-1.x86.exe'
$checksum32 = '38537e2cd70630d65a9868708fd305c5600d654fb736d1dbc16090fe9eb2894d'
$checksumType32 = 'sha256'
$url64 = 'http://www.swi-prolog.org/download/stable/bin/swipl-8.2.1-1.x64.exe'
$checksum64 = '45fc082c3f39188657e21c0bd51173a0be1bdb7528f584913ac7f18b49fd0cb6'
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
