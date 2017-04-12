Import-Module AU

$releases = 'https://github.com/monochromegane/the_platinum_searcher/releases'

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
	$downloadPage = Invoke-WebRequest -Uri $releases

	$re = 'pt_windows_(386|amd64)\.zip$'
	$url = $downloadPage.Links | Where-Object href -Match $re | Select-Object -First 2 -Expand href

	$version = $url[0] -Split '/|v' | Select-Object -Last 1 -Skip 1
	$url32 = 'https://github.com' + $url[0]
	$url64 = 'https://github.com' + $url[1]
	$releaseNotes = "https://github.com/monochromegane/the_platinum_searcher/releases/tag/v${version}"

	@{
		Version = $version
		URL32 = $url32
		URL64 = $url64
		ReleaseNotes = $releaseNotes
	}
}

Update-Package
