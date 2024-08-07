$hashone =Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\hash.ps1
$hashtwo = Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\idk.py

function Hash-return{
    param(
        [string] $file
    )
    Write-Host $file.Hash


   
}

Hash-return -file $hashone