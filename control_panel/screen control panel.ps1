$OpenFileDialog1_FileOk = {
}
Add-Type -AssemblyName "System.Drawing"

$teamImages = @{
    "Team BOB"         = "D:\BOB-Stream-Pages\icons\bob_logo_shadow.png"
    "Team BBY"         = "D:\BOB-Stream-Pages\icons\bby_logo_shadow.png"
    "Team Placeholder" = "D:\BOB-Stream-Pages\icons\placeholder_logo.png"
}

$for_js_tournament = "Primeleague"
$for_js_gameday = "Gameday"
$for_js_matchup = "Matchup"
$for_js_homeImage = $teamImages["Team BOB"]
$for_js_enemyImage = $teamImages["Team Placeholder"]

$labelTournament_Click = {
}
$labelGameday_Click = {
}
$labelMatchup_Click = {
}
$labelEnemyTeam_Click = {
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
    $selectHomeTeamImage.SelectedIndex = 0
    $pictureEnemyTeam.Image = [System.Drawing.Image]::FromFile($for_js_enemyImage)
    $selectTournament.SelectedIndex = 0

    $for_js_tournament = "Tournament"
    $for_js_gameday = "Gameday"
    $for_js_matchup = "Matchup"
    $for_js_homeImage = $teamImages["Team BOB"]
    $for_js_enemyImage = $teamImages["Team Placeholder"]

    $setCustomTournament.Text = ""
    $setGameday.Text = ""
    $setMatchup.Text = ""

    Clear-Host
    Write-Host "$for_js_tournament
$for_js_gameday
$for_js_matchup
$for_js_homeImage
$for_js_enemyImage"
}
$buttonApply_Click = {
    if ($selectTournament.SelectedItem -eq "Primeleague") {
        #Write-Host "Tournament name: Primeleague"
        $for_js_tournament = $selectTournament.SelectedItem 
    }
    else {
        #Write-Host "Tournament name:" $setCustomTournament.Text
        $for_js_tournament = $setCustomTournament.Text
    }

    $for_js_homeImage = ($teamImages[$selectHomeTeamImage.SelectedItem])
    $for_js_gameday = $setGameday.Text
    $for_js_matchup = $setMatchup.Text    
    $for_js_enemyImage = $SelectedEnemyImagePath

    Clear-Host
    Write-Host "$for_js_tournament
$for_js_gameday
$for_js_matchup
$for_js_homeImage
$for_js_enemyImage"
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

$pictureEnemyTeam.Image = [System.Drawing.Image]::FromFile($for_js_enemyImage)

$PageControls.ShowDialog()