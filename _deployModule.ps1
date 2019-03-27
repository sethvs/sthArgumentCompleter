
function Deploy-sthModule
{
    Param(
        [string]$ModuleName,
        [string]$ModulePath
    )

    $Path = Join-Path -Path $ModulePath -ChildPath $ModuleName
    
    Remove-Item -Path $Path -Recurse -ErrorAction SilentlyContinue -Force
    New-Item -ItemType Directory -Path $Path
    Copy-Item -Path .\* -Include *.psd1, *.psm1, *.ps1,*.ps1xml -Exclude *_* -Destination $Path
    Copy-Item -Path .\Profiles -Destination $Path -Exclude *_* -Recurse
    Copy-Item -Path .\Tests -Destination $Path -Exclude *_* -Recurse
    Copy-Item -Path .\en-us -Destination $Path -Exclude *_* -Recurse
    Copy-Item -Path .\ru-ru -Destination $Path -Exclude *_* -Recurse
}

$ModuleName = Split-Path -Path $PSScriptRoot -Leaf
$ModulePath = 'C:\Program Files\WindowsPowerShell\Modules'

Deploy-sthModule -ModuleName $ModuleName -ModulePath $ModulePath

$ModulePath = 'C:\Program Files\PowerShell\Modules'
Deploy-sthModule -ModuleName $ModuleName -ModulePath $ModulePath