Import-Module AU

$updateUrl = 'https://github.com/vim/vim-win32-installer/releases/latest'

function global:au_BeforeUpdate {
	$Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 sha256
	$Latest.ChecksumType32 = 'sha256'
	$Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64 sha256
	$Latest.ChecksumType64 = 'sha256'
}

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"    = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]url32\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
			"(?i)(^\s*[$]checksum32\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*[$]checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
			"(?i)(^\s*[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
			"(?i)(^\s*[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
			"(?i)(^\s*[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
		}

		"$($Latest.PackageName).nuspec" = @{
			"(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
		}
	}
}

function global:au_GetLatest {
	$updatePage = Invoke-WebRequest -Uri $updateUrl -UseBasicParsing

	$re = 'gvim_.+_(x64|x86)\.zip$'
	$url = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 2 -ExpandProperty href

	$version = $url[0] -Split '_' | Select-Object -Last 1 -Skip 1
	$url32 = 'https://github.com' + $url[1]
	$url64 = 'https://github.com' + $url[0]
	$releaseNotes = "https://github.com/vim/vim-win32-installer/releases/tag/v${version}"

	@{
		Version = $version
		URL32 = $url32
		URL64 = $url64
		ReleaseNotes = $releaseNotes
	}
}

Update-Package
