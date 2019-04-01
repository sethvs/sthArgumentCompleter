Param (
    $ReleaseDefinitionName,
    $ReleasePrimaryArtifactSourceAlias,
    $SystemDefaultWorkingDirectory
)

$SourcePath = Join-Path -Path $SystemDefaultWorkingDirectory -ChildPath $ReleasePrimaryArtifactSourceAlias
$ModulePath = Join-Path -Path $SystemDefaultWorkingDirectory -ChildPath $ReleaseDefinitionName

New-Item -ItemType Directory -Path $ModulePath | Out-Null
Copy-Item -Path $SourcePath\* -Include *.psd1, *.psm1, *.ps1,*.ps1xml -Exclude *_* -Destination $ModulePath
Copy-Item -Path $SourcePath\Tests -Destination $ModulePath -Exclude *_* -Recurse
Copy-Item -Path $SourcePath\en-us -Destination $ModulePath -Exclude *_* -Recurse
Copy-Item -Path $SourcePath\ru-ru -Destination $ModulePath -Exclude *_* -Recurse

Get-ChildItem $ModulePath -Recurse