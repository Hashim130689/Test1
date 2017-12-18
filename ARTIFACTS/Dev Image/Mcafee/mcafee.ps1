function Create-Folder {
    Param ([string]$path)
    if ((Test-Path $path) -eq $false) 
    {
        Write-Host "$path doesn't exist. Creating now.."
        New-Item -ItemType "directory" -Path $path
    }
}

function Download-File{
    Param ([string]$src, [string] $dst)

    (New-Object System.Net.WebClient).DownloadFile($src,$dst)
    #Invoke-WebRequest $src -OutFile $dst
}

function WaitForFile($File) {
  while(!(Test-Path $File)) {    
    Start-Sleep -s 10;   
  }  
} 


#Setup Folders

$setupFolder = "c:\Mcafee"
Create-Folder "$setupFolder"


if((Test-Path "$setupFolder\Mcafee.exe") -eq $false)
{
  
        Download-File "https://mylibrary123.blob.core.windows.net/reposit/Mcafee.exe" "$setupFolder\Mcafee.exe"  
}


#Instalaation of exe

Start-Process "$setupFolder\Mcafee.exe" -wait