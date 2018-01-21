Import-Module AU

$updateUrl = 'https://github.com/BurntSushi/ripgrep/releases'

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
	$updatePage = Invoke-WebRequest -Uri $updateUrl

	$re = 'ripgrep-.+-.+-pc-windows-msvc\.zip$'
	$url = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 2 -Expand href

	$version = $url[0] -Split '-' | Select-Object -Last 1 -Skip 4
	$url32 = 'https://github.com' + $url[0]
	$url64 = 'https://github.com' + $url[1]
	$releaseNotes = "https://github.com/BurntSushi/ripgrep/releases/tag/${version}"

	@{
		Version = $version
		URL32 = $url32
		URL64 = $url64
		ReleaseNotes = $releaseNotes
	}
}

Update-Package
