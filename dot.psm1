$dotfilesRoot = "$PSScriptRoot"
$configRoot = "$PSScriptRoot/configs"
$toolsRoot = "$PSScriptRoot/tools"

function Apply-File($dotfile)
{
  $app = $dotfile.App
  $name = $dotfile.Name
  $location = $dotfile.Location

  "applying dotfile $app/$name to $location"

  Copy-Item "$configRoot/$app/$name" $location -Force
}

function New-DotFile($app, $name, $location)
{
  $file = new-object PSObject

  $file | add-member -type NoteProperty -Name App -Value $app
  $file | add-member -type NoteProperty -Name Name -Value $name
  $file | add-member -type NoteProperty -Name Location -Value $location

  return $file
}

function Set-DotFiles($dotfiles)
{
    foreach ($d in $dotfiles)
    {
      Apply-File $d
    }
}

# from https://www.splunk.com/blog/2013/07/29/powershell-profiles-and-add-path.html
function Add-Path {
  <#
    .SYNOPSIS
      Adds a Directory to the Current Path
    .DESCRIPTION
      Add a directory to the current path.  This is useful for 
      temporary changes to the path or, when run from your 
      profile, for adjusting the path within your powershell 
      prompt.
    .EXAMPLE
      Add-Path -Directory "C:\Program Files\Notepad++"
    .PARAMETER Directory
      The name of the directory to add to the current path.
  #>

  [CmdletBinding()]
  param (
    [Parameter(
      Mandatory=$True,
      ValueFromPipeline=$True,
      ValueFromPipelineByPropertyName=$True,
      HelpMessage='What directory would you like to add?')]
    [Alias('dir')]
    [string[]]$Directory
  )

  PROCESS {
    $Path = $env:PATH.Split(';')

    foreach ($dir in $Directory) {
      if ($Path -contains $dir) {
        Write-Verbose "$dir is already present in PATH"
      } else {
        if (-not (Test-Path $dir)) {
          Write-Verbose "$dir does not exist in the filesystem"
        } else {
          $Path += $dir
        }
      }
    }

    $env:PATH = [String]::Join(';', $Path)
  }
}

$exportModuleMemberParams = @{
    Function = @(
        'Add-Path',
        'New-DotFile',
        'Set-DotFiles'
    )
}
Export-ModuleMember @exportModuleMemberParams
