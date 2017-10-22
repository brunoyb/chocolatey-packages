Import-Module AU

$releases = 'https://github.com/k-takata/the_silver_searcher-win32/releases'

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

	$re = 'ag-(\d{4}-\d{2}-\d{2})_(.+)-(x64|x86)\.zip$'
	$url = $downloadPage.Links | Where-Object href -Match $re | Select-Object -First 2 -Expand href

	$version = $Matches[2] -Replace '-', '.'
	$url32 = 'https://github.com' + $url[1] -Replace '%2F', '/'
	$url64 = 'https://github.com' + $url[0] -Replace '%2F', '/'
	$releaseNotes = "https://github.com/k-takata/the_silver_searcher-win32/releases/tag/$($Matches[1])/$($Matches[2])"

	@{
		Version = $version
		URL32 = $url32
		URL64 = $url64
		ReleaseNotes = $releaseNotes
	}
}

Update-Package
