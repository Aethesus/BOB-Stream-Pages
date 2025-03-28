$newTournamentName = Read-Host "Enter the new tournament name"

$filePath = "d:\New Bob\matchpage_for_control_page.html"

$htmlContent = Get-Content -Path $filePath -Raw

$htmlContent = [regex]::Replace($htmlContent, "(?<!resetContent\(\)\s*{[^}]*?)tournamentText\.textContent\s*=\s*'[^']*'", "tournamentText.textContent = '$newTournamentName'", 1)

Set-Content -Path $filePath -Value $htmlContent

Write-Host "Tournament name updated successfully to '$newTournamentName'."

Start-Process "file:///$filePath"