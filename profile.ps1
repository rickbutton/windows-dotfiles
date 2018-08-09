function reload-profile
{
	import-module c:/git/dotfiles/profile.ps1 -force
}

$env:Path += ";C:/git/dotfiles/PortableGit/bin"

import-module c:/git/dotfiles/posh-git/src/posh-git.psm1
Set-PSReadlineKeyHandler -Key Tab -Function Complete

if (test-path "c:/git")
{
	set-location "c:/git"
}

$env:Path += ";C:/git/dotfiles/gopass"

$env:Path += ";C:\git\dotfiles\rg"
import-module c:/git/dotfiles/rg/_rg.ps1

$env:FZF_DEFAULT_COMMAND = "rg --files --hidden --follow"
