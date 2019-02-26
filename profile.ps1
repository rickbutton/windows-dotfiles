$dotfilesRoot = "$PSScriptRoot"
$toolsRoot = $dotfilesRoot + "/tools"
import-module "$dotfilesRoot/dot.psm1"
import-module "$dotfilesRoot/config.psm1"

# NOTE: modification to these functions will not take until the powershell
# session is restarted, Reload-Profile will not actually reload these functions
# this is because this file is sourced, and is not imported as a module that can be removed
function Reload-Profile {
	remove-module "dot"
	remove-module "config"

	. "$dotfilesRoot/profile.ps1"
	import-module "$dotfilesRoot/dot.psm1"
	import-module "$dotfilesRoot/config.psm1"
}

function Update-DotFiles {
	Reload-Profile
	$dotfiles = Get-DotFiles
	Set-DotFiles $dotfiles
}

function Get-ScoopPackages {
    @(
		"git",
		"posh-git",
		"conemu",
		"openssh",
		"vscode",
		"python27",
		"python",
		"winmerge"
    )
}

function Install-ScoopPackages {
	$pkgs = Get-ScoopPackages
	foreach ($pkg in $pkgs) {
		scoop install $pkg
	}
}

###### scoop
Add-Path -Directory "$env:USERPROFILE\scoop\shims"
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')

###### git
Import-Module posh-git

###### gopass
Add-Path -Directory "$toolsRoot/gopass"

###### editor
$env:EDITOR="code --wait"

if (Test-Path alias:rp)
{
	Remove-Item alias:rp -Force
}

Add-Path -Directory "$toolsRoot/hugo"

if (Test-Path "C:/git/dotfiles-work")
{
	. "C:/git/dotfiles-work/profile.ps1"
}

if (!$env:INIT)
{
	if (Test-Path "C:/git")
	{
		set-location "c:/git"
	}
	"rb powershell profile loaded"
}


$env:INIT = $TRUE
