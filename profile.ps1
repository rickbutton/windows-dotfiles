$dotfilesRoot = "C:/git/dotfiles"
$toolsRoot = $dotfilesRoot + "/tools"

import-module "$dotfilesRoot/dot.ps1"

function reload-profile
{
	remove-module "profile"
	remove-module "dot"
	import-module "$dotfilesRoot/profile.ps1" -force
	import-module "$dotfilesRoot/dot.ps1" -force
}

$env:Path += ";$toolsRoot/PortableGit/bin"

import-module "$toolsRoot/posh-git/src/posh-git.psm1"
Set-PSReadlineKeyHandler -Key Tab -Function Complete

if (test-path "c:/git")
{
	set-location "c:/git"
}

$env:Path += ";$toolsRoot/gopass"

$env:Path += ";$toolsRoot/rg"
import-module "$toolsRoot/rg/_rg.ps1"

$env:FZF_DEFAULT_COMMAND = "rg --files --hidden --follow"

$env:EDITOR="code --wait"


"rb powershell profile loaded"