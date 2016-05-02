$package = 'Elixir'
$version = '1.2.4'

$params = @{
  PackageName = $package;
  FileType = 'zip';
  Url = "https://github.com/elixir-lang/elixir/releases/download/v$version/Precompiled.zip";
  UnzipLocation = $env:chocolateyPackageFolder;
}

if (!(Test-Path($params.UnzipLocation)))
{
  New-Item $params.UnzipLocation -Type Directory | Out-Null
}

Install-ChocolateyZipPackage @params

$elixirPath = "$env:ChocolateyPackageFolder/bin"
if (![System.IO.Directory]::Exists($elixirPath)) {$elixirPath = "$env:ChocolateyPackageFolder/bin";}
 
Install-ChocolateyEnvironmentVariable "Path" "$($env:Path);$elixirPath" Machine
Update-SessionEnvironment

Write-Host @'
The Elixir commands have been added to your path.

Please restart your current shell session to access Elixir commands:
elixir
elixirc
mix
iex.bat
'@
