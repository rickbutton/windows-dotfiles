$dotfilesRoot = "$PSScriptRoot"

function Get-DotFiles
{
    @(
        New-DotFile "vscode" "settings.json" "$env:APPDATA/Code/User/settings.json"
    )
}

$exportModuleMemberParams = @{
    Function = @(
        'Get-DotFiles'
    )
}
Export-ModuleMember @exportModuleMemberParams
