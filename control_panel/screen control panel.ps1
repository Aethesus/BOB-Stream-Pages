$teamImages = @{
    "Team BOB" = "D:\BOB-Stream-Pages\icons\bob_logo_shadow.png"
    "Team BBY" = "D:\BOB-Stream-Pages\icons\bby_logo_shadow.png"
}

$setCustomTournament_TextChanged = {
    $selectTournament_content = $setCustomTournament.Text
}
$selectHomeTeamImage_SelectedIndexChanged = {
    $selectedTeam = $selectHomeTeamImage.SelectedItem

    if ($teamImages.ContainsKey($selectedTeam)) {
        $pictureHomeTeam.Image = [System.Drawing.Image]::FromFile($teamImages[$selectedTeam])
    }
    else {
        $pictureHomeTeam.Image = $null
    }
}
$selectTournament_SelectedIndexChanged = {
    if ($selectTournament.SelectedItem -eq "Primeleague") {
        $setGameday.ReadOnly = $true
        $setMatchup.ReadOnly = $true
        $setCustomTournament.ReadOnly = $true
        $selectEnemyImage.Enabled = $false

        $selectTournament_content = $selectTournament.SelectedItem
    }
    else {
        $setGameday.ReadOnly = $false
        $setMatchup.ReadOnly = $false
        $setCustomTournament.ReadOnly = $false
        $selectEnemyImage.Enabled = $true
    }
}
$buttonReset_Click = {

}
$buttonApply_Click = {
    if ($selectTournament.SelectedItem -eq "Primeleague") {
        Write-Host "Tournament name: Primeleague"
    }
    else {
        Write-Host "Tournament name:" $setCustomTournament.Text
    }
    $selectedTeam = $selectHomeTeamImage.SelectedItem

    Write-Host "Home image path: " $($teamImages[$selectedTeam])
}
$Label2_Click = {
}
$Label3_Click = {
}
$Label5_Click = {
}
$Label7_Click = {
}
$OpenFileDialog1_FileOk = {
}
$selectEnemyImage_Click = {
    $OpenFileDialog = New-Object -TypeName System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.Filter = "Image Files (*.png;*.jpg;*.jpeg;*.bmp)|*.png;*.jpg;*.jpeg;*.bmp|All Files (*.*)|*.*"
    $OpenFileDialog.Title = "Select an Image File"

    if ($OpenFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $selectedFilePath = $OpenFileDialog.FileName

        $global:SelectedEnemyImagePath = $selectedFilePath

        try {
            $pictureEnemyTeam.Image = [System.Drawing.Image]::FromFile($selectedFilePath)
        }
        catch {
            $pictureEnemyTeam.Image = $null
        }
    }
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'screen control panel.designer.ps1')

$PageControls.ShowDialog()