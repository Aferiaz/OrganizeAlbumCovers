$Path = ""
$LogFile = ""

function Log-Error {
  param (
    [string]$ErrorMessage 
  )
  Add-Content -Path $LogFile -Value "$(Get-Date) - $ErrorMessage" 
}

function Remove-EmptyFolder {
  param (
    [string]$FolderPath
  )

  if(-not (Get-ChildItem -Path $FolderPath)) {
    try{
      Remove-Item -Path $FolderPath -Force
    }
    catch{
      Log-Error -ErrorMessage "Error Deleting Folder '$FolderPath' $_"
    }
  }
}

$Artists = Get-ChildItem -Path $Path -Directory -Name
$Artists | ForEach-Object{
  $Artist = $_
  $ArtistPath = Join-Path -Path $Path -ChildPath $Artist

  $Folders = Get-ChildItem -Directory -Name -Path $ArtistPath
  $Folders | ForEach-Object{ 
    $Folder = $_
    $FolderPath = Join-Path -Path $ArtistPath -ChildPath $Folder
    
    try{
      if($Folder -match "^${Artist} - "){
        $NewFolder = $Folder -replace "^${Artist} - ", ""
        $DestinationPath = Join-Path -Path $ArtistPath -ChildPath $NewFolder
  
        Move-Item -Path (Join-Path -Path $FolderPath -ChildPath "cover.*") -Destination $DestinationPath
      }
    }
    catch{
      Log-Error -ErrorMessage "Error Processing Folder '$FolderPath': $_"
    }

   Remove-EmptyFolder -FolderPath $FolderPath 
  }
}
