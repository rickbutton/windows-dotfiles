function Get-DotFiles
{
    @(
        New-DotFile "vscode" "settings.json" "$env:APPDATA/Code/User/settings.json"
        New-DotFile "conemu" "ConEmu.xml" "$env:APPDATA/ConEmu.xml"
    )
}

Export-ModuleMember -Function Get-DotFiles