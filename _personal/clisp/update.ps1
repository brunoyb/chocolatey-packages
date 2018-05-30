Import-Module AU

$updateUrl = 'http://clisp.org/'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
			"(?i)(^\s*[$]checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
		}

		"$($Latest.PackageName).nuspec" = @{
			"(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
		}
	}
}

function global:au_GetLatest {
	$updatePage = Invoke-WebRequest -Uri $updateUrl

	$re = 'Current version:.*(\d+\.\d+) \(\d{4}-\d{2}-\d{2}\)'
	if ($updatePage.Content -Match $re) {
		$version = $Matches[1]
		$url = "https://sourceforge.net/projects/clisp/files/clisp/$version/clisp-$version-win32-mingw-big.exe"
	} else {
		throw "Can't match '$re'"
	}

	$releaseNotes = $updatePage.Links | Where-Object href -Match 'NEWS' | Select-Object -First 1 -ExpandProperty href

	@{
		Version = $version
		URL = $url
		ReleaseNotes = $releaseNotes
	}
}

Update-Package -ChecksumFor 32
