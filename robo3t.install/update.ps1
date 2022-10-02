Import-Module AU

. $PSScriptRoot\..\_scripts\all.ps1

$githubRepositoryUrl = 'https://github.com/Studio3T/robomongo'

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')"    = "`$1'$($Latest.PackageName)'"
			"(?i)(^\s*[$]fileType\s*=\s*)('.*')"       = "`$1'$($Latest.FileType)'"
			"(?i)(^\s*[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
			"(?i)(^\s*[$]checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
			"(?i)(^\s*[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
		}

		".\tools\chocolateyUninstall.ps1" = @{
			"(?i)(^\s*[$]packageName\s*=\s*)('.*')" = "`$1'$($Latest.PackageName)'"
		}

		"$($Latest.PackageName).nuspec" = @{
			"(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
		}
	}
}

function global:au_GetLatest {
	$url = Get-GitHubReleaseUrl $githubRepositoryUrl 'robo3t-.+-windows-x86_64-[a-fA-F0-9]+\.exe$'
	$tag = $url -Split '/' | Select-Object -Last 1 -Skip 1

	@{
		Version = $tag.Substring(1)
		URL64 = $url
		ReleaseNotes = "${githubRepositoryUrl}/releases/tag/${tag}"
	}
}

if ($MyInvocation.InvocationName -NE '.') {
	Update-Package -ChecksumFor 64
}
