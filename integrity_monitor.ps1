#$hashone =Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\hash.ps1
#$hashtwo = Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\idk.py


Write-Host "1.)Collect Baseline"
Write-Host "2.)Begin from saved Baseline"

$option = Read-Host -Prompt 'Choice'

function Hash-return{
    param(
        [string] $file
    )
    $randNum = Get-Random -Minimum 1 -Maximum 3
    #Want to have random hash algorithms atleast 3, the diefference between them is the size of the resulting hash in terms of bits 
    #SHA 1 hash isn't really secure because it can cause hash collisons - basically getting the same hash from runnning two different things through the same SHA 1 algorithm 

    if ($randnum -eq 1){
        Get-FileHash $file -Algorithm 
    }
    elseif ($randnum -eq 2){
        Get-FileHash $file -Algorithm 
    }
    elseif ($randnum -eq 3){
        Get-FileHash $file -Algorithm 
    }

    
    #Hash Algorithm defaults to SHA256
}

Hash-return "C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\hash.ps1"

if ($option -eq 1){
    Write-Host "Process for Collecting Baseline"
}
elseif ($option -eq 2){
    Write-host "Process for saved baseline" 

}
else{
    Write-Host "Invalid."
}
