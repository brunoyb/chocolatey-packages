Import-Module AU

$updateUrl = 'https://www.fossil-scm.org/index.html/uv/download.js'

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
	$updatePage = Invoke-WebRequest -Uri $updateUrl

	$re = '"../timeline\?c=version-(.+)&amp;y=ci"'
	if ($updatePage.Content -Match $re) {
		$version = $Matches[1].Trim()
		$url = "https://www.fossil-scm.org/index.html/uv/fossil-w32-${version}.zip"
	} else {
		throw "Can't match '$re'"
	}

	@{
		Version = $version
		URL = $url
	}
}

Update-Package -ChecksumFor 32 -NoCheckChocoVersion
