Import-Module AU

$releases = 'https://github.com/monochromegane/the_platinum_searcher/releases'

function global:au_SearchReplace {
	@{
		'tools\chocolateyInstall.ps1' = @{
			"(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
			"(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
			"(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
			"(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}

function global:au_GetLatest {
	$downloadPage = Invoke-WebRequest -Uri $releases

	$re = 'pt_windows_(386|amd64).zip$'
	$url = $downloadPage.Links | Where-Object href -Match $re | Select-Object -First 2 -Expand href

	$version = $url[0] -Split '/|v' | Select-Object -Last 1 -Skip 1
	$url32 = 'https://github.com' + $url[0]
	$url64 = 'https://github.com' + $url[1]

	@{
		Version = $version
		URL32 = $url32
		URL64 = $url64
	}
}

Update-Package
