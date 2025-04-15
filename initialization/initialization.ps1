$lnkExists = Test-Path -Path "..\*.lnk"

$lnkFiles = Get-ChildItem -Path "..\" | Where-Object { $_.Name -like "*.lnk" } | Select-Object -ExpandProperty Name
$targetFiles = Get-ChildItem -Path "..\matchpage" | Where-Object { $_.Name -like "StartScript*" } | Select-Object -ExpandProperty Name

Write-Host "$lnkFiles"
Write-Host "$targetFiles"

foreach ($targetFile in $targetFiles) {
    if ($targetFile -like "*HTML*") {
        $targetWithHTML = $targetFile
    }
    else {
        $targetWithoutHTML = $targetFile
    }
}

foreach ($lnkFile in $lnkFiles) {

    $currentDirectory = Get-Location | Select-Object -ExpandProperty Path
    $parentDirectory = Split-Path -Path $currentDirectory -Parent

    $shortcutPath = $parentDirectory + "\" + $lnkFile

    if ($lnkFile -like "*WithHTML*") {
        $newTarget = "$parentDirectory\matchpage\$targetWithHTML"
    }
    else {
        Write-Host "NoHTML" + $lnkFile
        $newTarget = "$parentDirectory\matchpage\$targetWithoutHTML"
    }
    
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($shortcutPath)
    $Shortcut.TargetPath = $newTarget
    $Shortcut.Save()
}

$wshell = New-Object -ComObject Wscript.Shell

$wshell.Popup("$shortcutPath", 0, "Done", 0x1)



