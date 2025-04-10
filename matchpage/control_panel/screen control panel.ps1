$OpenFileDialog1_FileOk = {
}
Add-Type -AssemblyName "System.Drawing"

$teamImages = @{
    "Team BOB"         = "..\..\icons\bob_logo_shadow.png"
    "Team BBY"         = "..\..\icons\bby_logo_shadow.png"
    "Team Placeholder" = "..\..\icons\placeholder_logo.png"
}

$jsonFilePath = Join-Path $PSScriptRoot "..\ps_js_data.json"

$initialJSONData = @"
    {
        "enemyImage":  "..\\..\\icons\\placeholder_logo.png",
        "homeImage":  "..\\..\\icons\\bob_logo_shadow.png",
        "matchup":  "Matchup",
        "gameday":  "Gameday",
        "tournament":  "Tournament"
    }
"@

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

    sendToJSON
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

    sendToJSON
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

function sendToJSON {
    $jsonData = @{
        tournament = $for_js_tournament
        gameday    = $for_js_gameday
        matchup    = $for_js_matchup
        homeImage  = $for_js_homeImage
        enemyImage = $for_js_enemyImage
    } | ConvertTo-Json -Depth 4

    if (-Not (Test-Path $jsonFilePath)) {
        New-Item -Path $jsonFilePath -ItemType File
        Set-Content -Path $jsonFilePath -Value $initialJSONData -Force
    }
    
    Set-Content -Path $jsonFilePath -Value $jsonData -Force
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'screen control panel.designer.ps1')

$pictureEnemyTeam.Image = [System.Drawing.Image]::FromFile($for_js_enemyImage)

$PageControls.ShowDialog()