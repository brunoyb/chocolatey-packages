$ErrorActionPreference = 'Stop'

$packageName = 'vim'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'https://github.com/vim/vim-win32-installer/releases/download/v8.0.1428/gvim_8.0.1428_x86.exe'
$checksum = '4cc2a6a695848c63d80823d5abca0ea59854e997e97ccbd3312793df803cdeeb'
$checksumType = 'sha256'

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType

[array] $key = Get-UninstallRegistryKey -SoftwareName 'Vim*'

if ($key.Count -eq 1) {
	$key | ForEach-Object {
		Write-Host 'Adding the vim installation directory to PATH …'
		Install-ChocolateyPath "$(Split-Path -Parent $_.UninstallString)" 'Machine'
	}
}
