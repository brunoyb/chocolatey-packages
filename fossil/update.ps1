Import-Module AU

$updateUrl = 'https://www.fossil-scm.org/home/uv/download.js'

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
	}
}

function global:au_GetLatest {
	$updatePage = Invoke-WebRequest -Uri $updateUrl

	$re = '\.\./timeline\?p=version-([^&]+)'
	if ($updatePage.Content -Match $re) {
		$version = $Matches[1].Trim()
		$url32 = "https://www.fossil-scm.org/home/uv/fossil-w32-${version}.zip"
		$url64 = "https://www.fossil-scm.org/home/uv/fossil-w64-${version}.zip"
	} else {
		throw "Can't match '$re'"
	}

	@{
		Version = $version
		URL32 = $url32
		URL64 = $url64
	}
}

Update-Package
