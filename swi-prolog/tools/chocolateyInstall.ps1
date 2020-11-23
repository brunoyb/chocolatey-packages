$ErrorActionPreference = 'Stop'

$packageName = 'swi-prolog'
$fileType = 'exe'
$silentArgs = '/S'
$url32 = 'http://www.swi-prolog.org/download/stable/bin/swipl-8.2.3-1.x86.exe'
$checksum32 = 'a05901d850c8e3138dab176ab10fab6b44ba452d35c7076b65d213dfcd89c209'
$checksumType32 = 'sha256'
$url64 = 'http://www.swi-prolog.org/download/stable/bin/swipl-8.2.3-1.x64.exe'
$checksum64 = 'b4297d1d60ce050daf0d07764487370ef475cad70b54a96b074f83138d792cd6'
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
