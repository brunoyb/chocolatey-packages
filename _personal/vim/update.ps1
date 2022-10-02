Import-Module AU

. $PSScriptRoot\..\..\_scripts\all.ps1

$githubRepositoryUrl = 'https://github.com/vim/vim-win32-installer'

function global:au_BeforeUpdate {
	$Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 sha256
	$Latest.ChecksumType32 = 'sha256'
	$Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64 sha256
	$Latest.ChecksumType64 = 'sha256'
}

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
	$url = Get-GitHubReleaseUrl $githubRepositoryUrl 'gvim_.+_(x64|x86)\.zip$'
	$tag = $url[0] -Split '/' | Select-Object -Last 1 -Skip 1

	@{
		Version = $tag.Substring(1)
		URL32 = $url[1]
		URL64 = $url[0]
		ReleaseNotes = "${githubRepositoryUrl}/releases/tag/${tag}"
	}
}

Update-Package -ChecksumFor none -NoCheckChocoVersion
