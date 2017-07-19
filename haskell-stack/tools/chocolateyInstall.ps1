$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url32 = 'https://github.com/commercialhaskell/stack/releases/download/v1.5.0-rc1/stack-1.5.0-windows-i386.zip'
$checksum32 = '4a2d2d7dcc43df0184b7fa2a8018e10cd9a531c66e7421268acea71f7d8d7df9'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.5.0-rc1/stack-1.5.0-windows-x86_64.zip'
$checksum64 = 'ded27bc5de5b762454709cb1ebcde46d6723e979656d7ded056c99c5b313e220'
$checksumType64 = 'sha256'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageParameters = Get-PackageParameters

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -Checksum $checksum32 `
                             -ChecksumType $checksumType32 `
                             -Url64bit $url64 `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64 `
                             -UnzipLocation $toolsDir

# Most of the code in the `if` below is to workaround https://github.com/chocolatey/choco/issues/1015
if ($packageParameters.NoLocalBinOnPath -NE $true) {
	$pathToInstall = '%APPDATA%\local\bin'

	$actualPath = "$(Get-EnvironmentVariable -Name 'Path' -Scope 'Machine' -PreserveVariables)"
	$actualPathArray = $actualPath.Split(';', [System.StringSplitOptions]::RemoveEmptyEntries)

	if (($actualPathArray -INotContains $pathToInstall) -And
			($actualPathArray -INotContains "$($pathToInstall + '\')")) {
		Install-ChocolateyPath $pathToInstall 'Machine'
	}
}

if ($packageParameters.NoStackRoot -NE $true) {
	Install-ChocolateyEnvironmentVariable 'STACK_ROOT' "$(Join-Path $env:SystemDrive 'sr')" 'Machine'
}
