$dotfilesRoot = "C:/git/dotfiles"
$toolsRoot = $dotfilesRoot + "/tools"
import-module "$dotfilesRoot/dot.psm1"
import-module "$dotfilesRoot/config.psm1"

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
Set-PSReadlineKeyHandler -Key Tab -Function Complete

###### gopass
Add-Path -Directory "$toolsRoot/gopass"

###### rg
Add-Path -Directory "$toolsRoot/rg"
$env:FZF_DEFAULT_COMMAND = "rg --files --hidden --follow"

###### editor
$env:EDITOR="code --wait"

if (!$env:INIT -and (test-path "c:/git"))
{
	set-location "c:/git"
}

if (!$env:INIT) {
	"rb powershell profile loaded"
}
$env:INIT = $TRUE