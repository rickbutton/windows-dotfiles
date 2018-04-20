function reload-profile
{
	import-module c:/git/dotfiles/profile.ps1 -force
}


$nvimPath = "C:/git/dotfiles/neovim/bin"

function nvim
{
	iex "$nvimPath\nvim-qt -- $args -u C:/git/dotfiles/neovim/config/init.vim"
}

function nvim-safemode
{
	iex "$nvimPath\nvim-qt -- $args"
}

function nvim-edit-config
{
	nvim "C:/git/dotfiles/neovim/config/init.vim"
}

function nvim-edit-config-safemode
{
	nvim-safemode "C:/git/dotfiles/neovim/config/init.vim"
}

function nvim-edit-ps-profile
{
	nvim "C:/git/dotfiles/profile.ps1"
}

import-module c:/git/dotfiles/posh-git/src/posh-git.psm1
Set-PSReadlineKeyHandler -Key Tab -Function Complete

if (test-path "c:/git")
{
	set-location "c:/git"
}

$env:Path += ";C:/git/dotfiles/gopass"
