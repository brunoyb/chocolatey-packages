$ErrorActionPreference = 'Stop'

$packageName = 'haskell-stack'
$url32 = 'https://github.com/commercialhaskell/stack/releases/download/v1.4.0/stack-1.4.0-windows-i386.zip'
$checksum32 = '91b87b17a2a7dcaff951b0d5994b75024d5d34ef72d06b50c21f985ce280c7be'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/commercialhaskell/stack/releases/download/v1.4.0/stack-1.4.0-windows-x86_64.zip'
$checksum64 = 'f05e7c2108a10750a5be240170202e7c3e10fee1e196068c5539f85750bc7e2b'
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
