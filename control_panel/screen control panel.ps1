Add-Type -AssemblyName "System.Drawing"

$htmlPath = "..\matchpage\matchpage_for_control_page.html"

$teamImages = @{
    "Team BOB"         = "..\\art\\icons\\bob_logo.png"
    "Team BBY"         = "..\\art\\icons\\bby_logo.png"
    "Team Placeholder" = "..\\art\\icons\\placeholder_logo.png"
}

$jsFilePath = Join-Path $PSScriptRoot "..\matchpage\ps_js_data.js"

$initialJSData = @"
const psJsData = {
    "enemyImage":  "..\\art\\icons\\placeholder_logo.png",
    "homeImage":  "..\\art\\icons\\bob_logo.png",
    "matchup":  "Matchup",
    "gameday":  "Gameday",
    "tournament":  "Tournament"
    "videogame":  "Game"
};
"@

$staticVideogames = @("League of Legends", "Valorant")

$for_js_tournament = "Primeleague"
$for_js_gameday = "Gameday"
$for_js_matchup = "Matchup"
$for_js_homeImage = $teamImages["Team BOB"]
$for_js_enemyImage = $teamImages["Team Placeholder"]
$for_js_videogame = "Game"

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
    $selectVideogame.SelectedIndex = 0

    $for_js_tournament = "Tournament"
    $for_js_gameday = "Gameday"
    $for_js_matchup = "Matchup"
    $for_js_homeImage = $teamImages["Team BOB"]
    $global:SelectedEnemyImagePath = $teamImages["Team Placeholder"]

    $setCustomTournament.Text = ""
    $setGameday.Text = ""
    $setMatchup.Text = ""
    $setVideogame.Text = ""

    Clear-Host
    Write-Host "$for_js_tournament
$for_js_gameday
$for_js_matchup
$for_js_homeImage
$for_js_enemyImage"

    sendToJS
}
$buttonApply_Click = {
    Write-Host $for_js_videogame

    if ($selectTournament.SelectedItem -eq "Primeleague") {
        #Write-Host "Tournament name: Primeleague"
        $for_js_tournament = $selectTournament.SelectedItem 
    }
    else {
        #Write-Host "Tournament name:" $setCustomTournament.Text
        $for_js_tournament = $setCustomTournament.Text
    }

    if ($staticVideogames -contains $selectVideogame.SelectedItem) {
        $for_js_videogame = $selectVideogame.SelectedItem 
    }
    else {
        $for_js_videogame = $setVideogame.Text
    }

    $for_js_homeImage = ($teamImages[$selectHomeTeamImage.SelectedItem])
    $for_js_gameday = $setGameday.Text
    $for_js_matchup = $setMatchup.Text    
    $for_js_enemyImage = $global:SelectedEnemyImagePath

    Clear-Host
    Write-Host "$for_js_tournament
$for_js_gameday
$for_js_matchup
$for_js_homeImage
$for_js_enemyImage
$for_js_videogame"

    Write-Host "Selected Enemy Image Path: $global:SelectedEnemyImagePath"

    sendToJS
}

$global:SelectedEnemyImagePath = "..\\art\\icons\\placeholder_logo.png"

$selectEnemyImage_Click = {
    $OpenFileDialog = New-Object -TypeName System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.Filter = "Image Files (*.png;*.jpg)|*.png;*.jpg" # Restrict to PNG and JPG files
    $OpenFileDialog.Title = "Select an Image File"

    if ($OpenFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $selectedFilePath = $OpenFileDialog.FileName
        $fileExtension = [System.IO.Path]::GetExtension($selectedFilePath)

        if ($fileExtension -notin @(".png", ".jpg")) {
            Write-Host "Invalid file type selected. Only PNG and JPG files are allowed."
            return
        }

        $iconsFolderPath = (Resolve-Path -Path (Join-Path $PSScriptRoot "..\art\icons")).Path
        if (-Not (Test-Path $iconsFolderPath)) {
            New-Item -Path $iconsFolderPath -ItemType Directory -Force
        }

        $targetEnemyImagePath = Join-Path $iconsFolderPath ("enemy_logo" + $fileExtension)
        Write-Host "Resolved Path: $targetEnemyImagePath"

        if ($pictureEnemyTeam.Image -ne $null) {
            $pictureEnemyTeam.Image = $null
            [System.GC]::Collect()
            [System.GC]::WaitForPendingFinalizers()
        }

        $existingEnemyLogoFiles = Get-ChildItem -Path $iconsFolderPath -Filter "enemy_logo.*"
        foreach ($file in $existingEnemyLogoFiles) {
            Remove-Item -Path $file.FullName -Force
            Write-Host "Deleted existing file: $file.FullName"
        }

        try {
            Copy-Item -Path $selectedFilePath -Destination $targetEnemyImagePath -Force
            Write-Host "Image copied successfully to: $targetEnemyImagePath"

            $global:SelectedEnemyImagePath = "..\\art\\icons\\enemy_logo" + $fileExtension

            $pictureEnemyTeam.Image = [System.Drawing.Image]::FromFile($targetEnemyImagePath)
        }
        catch {
            Write-Host "Failed to copy image: $_"
            $pictureEnemyTeam.Image = $null
        }
    }
}

$selectVideogame_SelectedIndexChanged = {

    if ($staticVideogames -contains $selectVideogame.SelectedItem) {
        $setVideogame.ReadOnly = $true

        $selectVideogame_content = $selectVideogame.SelectedItem
        $for_js_videogame = $selectVideogame.SelectedItem
    }
    else {
        $setVideogame.ReadOnly = $false
    }
}

$setVideogame_TextChanged = {
    $selectVideogame_content = $setVideogame.Text
    $for_js_videogame = $setVideogame.Text
    
    if ($($setVideogame.Text).Length -gt 20) {
        Write-Host "Text exceeds 20 characters" 
    }
}

$openHTML_Click = {
    $htmlPathTest = Test-Path $htmlPath
    if ($htmlPathTest -eq $true) {
        Start-Process $htmlPath
    }
    else {
        Write-Host "HTML file not found at path: $htmlPath"
    }
}

Write-Host $for_js_videogame

function sendToJS {
    $jsData = "const psJsData = " + (@{
            tournament = $for_js_tournament
            gameday    = $for_js_gameday
            matchup    = $for_js_matchup
            homeImage  = $for_js_homeImage
            enemyImage = $global:SelectedEnemyImagePath
            videogame  = $for_js_videogame
        } | ConvertTo-Json -Depth 4) + ";"

    if (-Not (Test-Path $jsFilePath)) {
        New-Item -Path $jsFilePath -ItemType File
    }
    
    Set-Content -Path $jsFilePath -Value $jsData -Force
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'screen control panel.designer.ps1')

if (Test-Path $global:SelectedEnemyImagePath) {
    $pictureEnemyTeam.Image = [System.Drawing.Image]::FromFile($global:SelectedEnemyImagePath)
}
else {
    Write-Host "Image not found: $global:SelectedEnemyImagePath. Using placeholder."
    $pictureEnemyTeam.Image = [System.Drawing.Image]::FromFile("..\\art\\icons\\placeholder_logo.png")
}

$PageControls.ShowDialog()