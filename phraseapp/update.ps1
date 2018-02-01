Import-Module AU

$updateUrl = 'https://github.com/phrase/phraseapp-client/releases/latest'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"    = "`$1'$($Latest.PackageName)'"
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

	$re = 'phraseapp_windows_amd64\.exe\.zip$'
	$url64 = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 1 -Expand href

	$version = $url64 -Split '/' | Select-Object -Last 1 -Skip 1
	$url64 = 'https://github.com' + $url64
	$releaseNotes = "https://github.com/phrase/phraseapp-client/releases/tag/${version}"

	@{
		Version = $version
		URL64 = $url64
		ReleaseNotes = $releaseNotes
	}
}

Update-Package -ChecksumFor 64
