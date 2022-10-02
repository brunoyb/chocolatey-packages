Import-Module AU

. $PSScriptRoot\..\_scripts\all.ps1

$githubRepositoryUrl = 'https://github.com/phrase/phraseapp-client'

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
	$url = Get-GitHubReleaseUrl $githubRepositoryUrl 'phraseapp_windows_amd64\.exe\.zip$'
	$tag = $url -Split '/' | Select-Object -Last 1 -Skip 1

	@{
		Version = $tag
		URL64 = $url
		ReleaseNotes = "${githubRepositoryUrl}/releases/tag/${tag}"
	}
}

Update-Package -ChecksumFor 64
