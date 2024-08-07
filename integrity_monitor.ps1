#$hashone =Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\hash.ps1
#$hashtwo = Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\idk.py


Write-Host "1.)Collect Baseline"
Write-Host "2.)Begin from saved Baseline"

$option = Read-Host -Prompt 'Choice'

if ($option -eq 1){
    Write-Host "Process for Collecting Baseline"
}
elif ($option -eq 2){
    Write-host "Process for saved baseline" 

}
else{
    Write-Host "Invalid."
}
         