Write-Host "1.)Collect Baseline"
Write-Host "2.)Begin from saved Baseline"

$option = Read-Host -Prompt 'Choice'

if ($option -eq 1){
    #Process for Collecting Baseline
}
elif ($option -eq 2){
    #Process for saved baseline

}
else{
    Write-Host "Invalid."
}
    