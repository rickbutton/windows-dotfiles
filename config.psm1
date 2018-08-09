function Get-DotFiles
{
    @(
        New-DotFile "vscode" "settings.json" "$env:APPDATA/Code/User/settings.json"
    )
}

Export-ModuleMember -Function Get-DotFiles