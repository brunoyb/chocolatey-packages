. $PSScriptRoot\..\robo3t.install\update.ps1

function global:au_SearchReplace {
	@{
		"$($Latest.PackageName).nuspec" = @{
			"(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
		}
	}
}

function global:au_AfterUpdate {
	Set-DescriptionFromReadme -SkipFirst 2
}

Update-Package -ChecksumFor none
