#Let's see if we can run hourly backups of our Minecraft Server files.

$logfile = "D:\backups\minecraft\log\minecraft_server_backup_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"

function log($string, $color)
{
   if ($Color -eq $null) {$color = "white"}
   write-host $string -foregroundcolor $color
   $string | out-file -Filepath $logfile -append
}

Copy-item -path 'D:\Minecraft Python\Spigot_1.11_Server' -Recurse -Destination 'D:\backups\minecraft' | Out-File -FilePath $logfile
    if 

log "Successfully backed up the Minecraft server $(get-date -format '"yyyMMdd_hhmm'").txt"