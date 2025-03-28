$TextBox1_TextChanged = {
}
$selectHomeTeamImage_SelectedIndexChanged = {
    # Get the selected team
    $selectedTeam = $selectHomeTeamImage.SelectedItem

    # Define the image paths for each team
    $teamImages = @{
        "Team BOB" = "D:\BOB-Stream-Pages\icons\bob_logo_shadow.png"
        "Team BBY" = "D:\BOB-Stream-Pages\icons\bby_logo_shadow.png"
    }

    # Check if the selected team has a corresponding image
    if ($teamImages.ContainsKey($selectedTeam)) {
        # Load the image into the PictureBox
        $pictureHomeTeam.Image = [System.Drawing.Image]::FromFile($teamImages[$selectedTeam])
    }
    else {
        # Clear the PictureBox if no image is found
        $pictureHomeTeam.Image = $null
    }
}
$selectTournament_SelectedIndexChanged = {
    if ($selectTournament.SelectedItem -eq "Primeleague") {
        $setGameday.ReadOnly = $true
        $setMatchup.ReadOnly = $true
        $setCustomTournament.ReadOnly = $true
        $selectEnemyImage.Enabled = $false
    }
    else {
        $setGameday.ReadOnly = $false
        $setMatchup.ReadOnly = $false
        $setCustomTournament.ReadOnly = $false
        $selectEnemyImage.Enabled = $true
    }
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
$Button1_Click = {
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