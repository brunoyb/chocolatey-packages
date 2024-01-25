Import-Module AU

. $PSScriptRoot\..\_scripts\all.ps1

$githubRepositoryUrl = 'https://github.com/sbt/sbt'

function global:au_BeforeUpdate {
	$Latest.Checksum32 = Get-RemoteChecksum $Latest.URL sha256
	$Latest.ChecksumType32 = 'sha256'
}

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
	$url = Get-GitHubReleaseUrl $githubRepositoryUrl 'sbt-.+\.msi$'
	$tag = $url -Split '/' | Select-Object -Last 1 -Skip 1

	@{
		Version = $tag.Substring(1)
		URL = $url
		ReleaseNotes = "${githubRepositoryUrl}/releases/tag/${tag}"
	}
}

Update-Package -ChecksumFor none
