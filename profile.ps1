$dotfilesRoot = "$PSScriptRoot"
$toolsRoot = $dotfilesRoot + "/tools"
import-module "$dotfilesRoot/dot.psm1"
import-module "$dotfilesRoot/config.psm1"

# NOTE: modification to these functions will not take until the powershell
# session is restarted, Reload-Profile will not actually reload these functions
# this is because this file is sourced, and is not imported as a module that can be removed
function Reload-Profile() {
	remove-module "dot"
	remove-module "config"

	. "$dotfilesRoot/profile.ps1"
	import-module "$dotfilesRoot/dot.psm1"
	import-module "$dotfilesRoot/config.psm1"
}
function Update-Dotfiles() {
	Reload-Profile
	$dotfiles = Get-DotFiles
	Set-DotFiles $dotfiles
}

###### git
Add-Path -Directory "$toolsRoot/PortableGit/bin"
Import-Module "$toolsRoot/posh-git/src/posh-git.psm1"
if (Get-Command "Set-PSReadlineKeyHandler" -ErrorAction SilentlyContinue)
{
	Set-PSReadlineKeyHandler -Key Tab -Function Complete
}
###### end git

###### gopass
Add-Path -Directory "$toolsRoot/gopass"
###### end gopass

###### rg
Add-Path -Directory "$toolsRoot/rg"
$env:FZF_DEFAULT_COMMAND = "rg --files --hidden --follow"
###### end rg

###### editor
$env:EDITOR="code --wait"
###### end editor

Add-Path -Directory "C:\Python36-32"
Add-Path -Directory "C:\Python36-32\Scripts"
Add-Path -Directory "$toolsRoot/ledger"

if (!$env:INIT)
{
	if (Test-Path "C:/git")
	{
		set-location "c:/git"
	}
	"rb powershell profile loaded"
}

$env:INIT = $TRUE
