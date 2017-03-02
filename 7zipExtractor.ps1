# This piece of PowerShell will examine a directory, filter out the parts of a multi-part .rar archive and then begin the extraction job on the primary file.
# it will then move on to the next primary and begin again while displaying progress in the shell.


#This will get the list of files within each folder recursively

$filelist = Get-ChildItem -Path G:\folder\ -Recurse | Where-Object {$_.name -like "*.rar" -and $_.name -notlike "*part0*.rar" -and $_.name -notlike "*part1*.rar" -and $_.name -notlike "*sub.rar"}
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