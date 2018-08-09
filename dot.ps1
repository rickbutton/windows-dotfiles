$configRoot = "$PSScriptRoot/configs"

function apply-file($app, $name, $location)
{
    Copy-Item "$configRoot/$app/$name" $location -Force
}

function apply-dotfiles
{
    apply-file "vscode" "settings.json" "$env:APPDATA/Code/User/settings.json"
}