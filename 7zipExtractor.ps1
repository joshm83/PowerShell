
#This will get the list of files within each folder recursively

$filelist = Get-ChildItem -Path G:\Movies\ -Recurse | Where-Object {$_.name -like "*.rar" -and $_.name -notlike "*part0*.rar" -and $_.name -notlike "*part1*.rar" -and $_.name -notlike "*subs-saints.rar"}
$count = $null

#Extract each compressed archive

foreach ($file in $filelist.fullname)
{
    Write-Host "Expanding Archive... $file" -ForegroundColor Green
    Expand-7Zip -ArchiveFileName "$($file)" -TargetPath D:\Extract 
    $count++
    Write-Progress -Activity "Checking" -Status "Completed: $count of $($filelist.Count)"
    Write-Host "Successfully Expanded Archive... $file" -ForegroundColor Cyan
}

Write-Host "Job Complete, all files successfully expanded." -ForegroundColor Yellow

#comment added test

#Let's add a new comment.