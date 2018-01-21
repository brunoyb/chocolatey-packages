Import-Module AU

$updateUrl = 'http://x128.ho.ua/pngutils.html'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
			"(?i)(^\s*[$]checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
		}
	}
}

function global:au_GetLatest {
	$updatePage = Invoke-WebRequest -Uri $updateUrl -UseBasicParsing

	$re = 'TruePNG_\d+\.zip$'
	$url = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 1 -Expand href
	$version = $($url -Split '_|\.' | Select-Object -Last 1 -Skip 1).ToCharArray() -Join '.'

	@{
		Version = $version
		URL = $url
	}
}

Update-Package -ChecksumFor 32
