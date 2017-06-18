$ErrorActionPreference = 'Stop'

$packageName = 'ag'
$url = 'https://github.com/JFLarvoire/the_silver_searcher/releases/download/1.0.2-Windows/ag.zip'
$checksum = 'ee336ba4afdaf3a4b3c350783dcf30a1f53cd1d192428082df11bf7ee3e168c6'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -UnzipLocation $toolsDir

if ((Get-ProcessorBits 64) -And $env:chocolateyForceX86 -NE $true) {
	New-Item "$(Join-Path $toolsDir 'WIN32\ag.exe.ignore')" -Type file -Force | Out-Null
} else {
	New-Item "$(Join-Path $toolsDir 'WIN64\ag.exe.ignore')" -Type file -Force | Out-Null
}
