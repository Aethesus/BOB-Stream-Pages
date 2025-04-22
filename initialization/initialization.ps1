$controlpanelFolder = "control_panel"

$lnkFile = Get-ChildItem -Path "..\" | Where-Object { $_.Name -like "*.lnk" } | Select-Object -ExpandProperty Name
$targetFile = Get-ChildItem -Path "..\$controlpanelFolder" | Where-Object { $_.Name -like "*.bat" } | Select-Object -ExpandProperty Name

$shortcutIcon = Get-ChildItem -Path "..\art\icons" | Where-Object { $_.Name -like "*script_icon*" } | Select-Object -ExpandProperty FullName

$currentDirectory = Get-Location | Select-Object -ExpandProperty Path
$parentDirectory = Split-Path -Path $currentDirectory -Parent

$shortcutPath = $parentDirectory + "\" + $lnkFile

$newTarget = "$parentDirectory\$controlpanelFolder\$targetFile"
    
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($shortcutPath)
$Shortcut.TargetPath = $newTarget
$Shortcut.IconLocation = $shortcutIcon
$Shortcut.Save()

Write-Host $lnkFile
Write-Host $targetFile
Write-Host $shortcutPath
Write-Host $newTarget
Write-Host $shortcutIcon

$wshell = New-Object -ComObject Wscript.Shell

$wshell.Popup("$shortcutPath", 0, "Done", 0x1)



