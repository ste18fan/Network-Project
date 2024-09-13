#$hashone =Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\hash.ps1
 #$hashtwo = Get-FileHash C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\idk.py


 #Extra SHA Algorithms 
 # if ($randNum -eq 1){
    #     $f_hash=Get-FileHash $file -Algorithm SHA384
    #     return $f_hash
    # }
    # elseif ($randNum -eq 2){
    #     $f_hash=Get-FileHash $file -Algorithm SHA256
    #     return $f_hash
    # }
    # elseif ($randNum -eq 3){
    #     $f_hash=Get-FileHash $file -Algorithm SHA512
    #     return $f_hash
    # }

 #HEY STEFAN DO TRY AND CATCH BECAUSE ERROR IS FILE MONITOR TRYING TO DO A FOLDERRRRRR
python -c "import os; 
curdir=os.getcwd()
contents = os.listdir(curdir)
print(contents)"

Write-Host "1.)Collect Baseline"
Write-Host "2.)Begin from saved Baseline"

$option = Read-Host -Prompt 'Choice'

#functions
function Hash-return{
    param(
        [string] $file
    )
    $randNum = Get-Random -Minimum 1 -Maximum 3

function baselineErasure(){
    $baseExist = Test-Path -path .\baseline.txt

    if($baseExist){
        Remove Item -Path .\baseline.txt
    }
}

    #Want to have random hash algorithms atleast 3, the difference between them is the size of the resulting hash in terms of bits 
    #SHA 1 hash isn't really secure because it can cause hash collisons - basically getting the same hash from runnning two different things through the same SHA 1 algorithm    

    $f_hash=Get-FileHash $file -Algorithm SHA384
    return $f_hash

    # if ($randNum -eq 1){
    #     $f_hash=Get-FileHash $file -Algorithm SHA384
    #     return $f_hash
    # }
    # elseif ($randNum -eq 2){
    #     $f_hash=Get-FileHash $file -Algorithm SHA256
    #     return $f_hash
    # }
    # elseif ($randNum -eq 3){
    #     $f_hash=Get-FileHash $file -Algorithm SHA512
    #     return $f_hash
    # }

    #Hash Algorithm defaults to SHA256
}

#Get input for baseline and do if statement for if path does not exist
Hashreturn "C:\Users\stefa\OneDrive\Desktop\PScripts\Python_Stuff\hash.ps1"

if ($option -eq 1){
    #Clear baseline
    Write-Host "Process for Collecting Baseline"
    baselineErasure
    #Collect files in dir to monitor
    $files = Get-ChildItem -Path .\
    foreach($thing in $files){
        # Used Hash-return function to return hash of file 
        $file_hash=Hashreturn $thing.FullName
        "Path: $($file_hash.Path)||Hash: $($file_hash.Hash)" | Out-File -FilePath .\baseline.txt -Append
    }
    for($i=0; $i -le 100; $i+=20){
        Write-Progress -Activity "Search In Progress" -Status "$i% complete: " -PercentComplete $i;
        Start-Sleep 1
    }
    #Add End of Scan listing date and time it was performed
    $datetime =Get-Date -Format "MM-dd-yyyy | HH:mm:ss"
    $endScan= "--------------------End of Scan-> "+ $datetime + "--------------------" 
    $endScan| Out-File -FilePath .\baseline.txt -Append
    Write-Host "--------------------End of Scan-> "+ $datetime + "--------------------" -ForegroundColor Green 
 
}
elseif ($option -eq 2){
    Write-host "Process for saved baseline" 

}
else{
    Write-Host "Invalid."
}





function Hashreturn{
    param(
        [string] $file
    )
    # $randNum = Get-Random -Minimum 1 -Maximum 3
    #Want to have random hash algorithms atleast 3, the difference between them is the size of the resulting hash in terms of bits 
    #SHA 1 hash isn't really secure because it can cause hash collisons - basically getting the same hash from runnning two different things through the same SHA 1 algorithm    

   
    try{ 
        $f_hash=Get-FileHash $file 
        return $f_hash
        #Exclude .git and .vscode from process
    } 
    catch{
    Write-Warning -Message "Monitor Tried to read a folder. Ignore."
    Write-Warning -Messsage "Exception Type: "
}
}
