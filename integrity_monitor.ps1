#$hashone =Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\hash.ps1
#$hashtwo = Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\idk.py
python -c "import os; 
curdir=os.getcwd()
contents = os.listdir(curdir)
print(contents)"


Write-Host "1.)Collect Baseline"
Write-Host "2.)Begin from saved Baseline"

$option = Read-Host -Prompt 'Choice'

function Hash-return{
    param(
        [string] $file
    )
    $randNum = Get-Random -Minimum 1 -Maximum 3
     #Want to have random hash algorithms atleast 3, the difference between them is the size of the resulting hash in terms of bits 
    #SHA 1 hash isn't really secure because it can cause hash collisons - basically getting the same hash from runnning two different things through the same SHA 1 algorithm    

    if ($randNum -eq 1){
        $f_hash=Get-FileHash $file -Algorithm SHA384
        return $f_hash
    }
    elseif ($randNum -eq 2){
        $f_hash=Get-FileHash $file -Algorithm SHA256
        return $f_hash
    }
    elseif ($randNum -eq 3){
        $f_hash=Get-FileHash $file -Algorithm SHA512
        return $f_hash
    }

    #Hash Algorithm defaults to SHA256
}

Hash-return "C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\hash.ps1"

if ($option -eq 1){
    Write-Host "Process for Collecting Baseline"
    #Collect files in dir to monitor
    $files = Get-ChildItem -Path .\
    foreach($thing in $files){
        $file_hash=Hash-return $thing.FullName
        "Path: $($file_hash.Path)||Hash: $($file_hash.Hash)" | Out-File -FilePath .\baseline.txt -Append
    }
 
}
elseif ($option -eq 2){
    Write-host "Process for saved baseline" 

}
else{
    Write-Host "Invalid."
}
