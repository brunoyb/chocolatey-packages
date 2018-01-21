Import-Module AU

$updateUrl = 'https://github.com/vim/vim-win32-installer/releases/latest'

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

	$re = 'gvim_.+_x86\.exe$'
	$url = $updatePage.Links | Where-Object href -Match $re | Select-Object -First 1 -Expand href

	$version = $url -Split '_' | Select-Object -Last 1 -Skip 1
	$url = 'https://github.com' + $url
	$releaseNotes = "https://github.com/vim/vim-win32-installer/releases/tag/v${version}"

	@{
		Version = $version
		URL = $url
		ReleaseNotes = $releaseNotes
	}
}

Update-Package -ChecksumFor 32
