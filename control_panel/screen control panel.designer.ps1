$PageControls = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.TabControl]$pagesControl = $null
[System.Windows.Forms.TabPage]$pageMatchup = $null
[System.Windows.Forms.TextBox]$setCustomTournament = $null
[System.Windows.Forms.Button]$buttonReset = $null
[System.Windows.Forms.Button]$buttonApply = $null
[System.Windows.Forms.PictureBox]$pictureEnemyTeam = $null
[System.Windows.Forms.PictureBox]$pictureHomeTeam = $null
[System.Windows.Forms.Label]$labelEnemyTeam = $null
[System.Windows.Forms.Button]$selectEnemyImage = $null
[System.Windows.Forms.Label]$labelHomeTeam = $null
[System.Windows.Forms.ComboBox]$selectHomeTeamImage = $null
[System.Windows.Forms.Label]$labelMatchup = $null
[System.Windows.Forms.Label]$labelGameday = $null
[System.Windows.Forms.Label]$labelTournament = $null
[System.Windows.Forms.TextBox]$setMatchup = $null
[System.Windows.Forms.TextBox]$setGameday = $null
[System.Windows.Forms.Label]$labelMatchupTitle = $null
[System.Windows.Forms.ComboBox]$selectTournament = $null
[System.Windows.Forms.TabPage]$pagePlayerSpotlight = $null
[System.Windows.Forms.TabPage]$pageComingSoon = $null
function InitializeComponent {
    $pagesControl = (New-Object -TypeName System.Windows.Forms.TabControl)
    $pageMatchup = (New-Object -TypeName System.Windows.Forms.TabPage)
    $buttonReset = (New-Object -TypeName System.Windows.Forms.Button)
    $buttonApply = (New-Object -TypeName System.Windows.Forms.Button)
    $pictureEnemyTeam = (New-Object -TypeName System.Windows.Forms.PictureBox)
    $pictureHomeTeam = (New-Object -TypeName System.Windows.Forms.PictureBox)
    $labelEnemyTeam = (New-Object -TypeName System.Windows.Forms.Label)
    $selectEnemyImage = (New-Object -TypeName System.Windows.Forms.Button)
    $labelHomeTeam = (New-Object -TypeName System.Windows.Forms.Label)
    $selectHomeTeamImage = (New-Object -TypeName System.Windows.Forms.ComboBox)
    $labelMatchup = (New-Object -TypeName System.Windows.Forms.Label)
    $labelGameday = (New-Object -TypeName System.Windows.Forms.Label)
    $labelTournament = (New-Object -TypeName System.Windows.Forms.Label)
    $setMatchup = (New-Object -TypeName System.Windows.Forms.TextBox)
    $setGameday = (New-Object -TypeName System.Windows.Forms.TextBox)
    $labelMatchupTitle = (New-Object -TypeName System.Windows.Forms.Label)
    $selectTournament = (New-Object -TypeName System.Windows.Forms.ComboBox)
    $pagePlayerSpotlight = (New-Object -TypeName System.Windows.Forms.TabPage)
    $pageComingSoon = (New-Object -TypeName System.Windows.Forms.TabPage)
    $setCustomTournament = (New-Object -TypeName System.Windows.Forms.TextBox)
    $pagesControl.SuspendLayout()
    $pageMatchup.SuspendLayout()
([System.ComponentModel.ISupportInitialize]$pictureEnemyTeam).BeginInit()
([System.ComponentModel.ISupportInitialize]$pictureHomeTeam).BeginInit()
    $PageControls.SuspendLayout()
    #
    #pagesControl
    #
    $pagesControl.Controls.Add($pageMatchup)
    $pagesControl.Controls.Add($pagePlayerSpotlight)
    $pagesControl.Controls.Add($pageComingSoon)
    $pagesControl.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12, [System.Int32]12))
    $pagesControl.Name = [System.String]'pagesControl'
    $pagesControl.SelectedIndex = [System.Int32]0
    $pagesControl.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]760, [System.Int32]537))
    $pagesControl.TabIndex = [System.Int32]1
    #
    #pageMatchup
    #
    $pageMatchup.Controls.Add($setCustomTournament)
    $pageMatchup.Controls.Add($buttonReset)
    $pageMatchup.Controls.Add($buttonApply)
    $pageMatchup.Controls.Add($pictureEnemyTeam)
    $pageMatchup.Controls.Add($pictureHomeTeam)
    $pageMatchup.Controls.Add($labelEnemyTeam)
    $pageMatchup.Controls.Add($selectEnemyImage)
    $pageMatchup.Controls.Add($labelHomeTeam)
    $pageMatchup.Controls.Add($selectHomeTeamImage)
    $pageMatchup.Controls.Add($labelMatchup)
    $pageMatchup.Controls.Add($labelGameday)
    $pageMatchup.Controls.Add($labelTournament)
    $pageMatchup.Controls.Add($setMatchup)
    $pageMatchup.Controls.Add($setGameday)
    $pageMatchup.Controls.Add($labelMatchupTitle)
    $pageMatchup.Controls.Add($selectTournament)
    $pageMatchup.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]4, [System.Int32]22))
    $pageMatchup.Name = [System.String]'pageMatchup'
    $pageMatchup.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]3))
    $pageMatchup.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]752, [System.Int32]511))
    $pageMatchup.TabIndex = [System.Int32]0
    $pageMatchup.Text = [System.String]'Matchpage'
    $pageMatchup.UseVisualStyleBackColor = $true
    $pageMatchup.add_Click($OpenFileDialog1_FileOk)
    #
    #buttonReset
    #
    $buttonReset.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]87, [System.Int32]482))
    $buttonReset.Name = [System.String]'buttonReset'
    $buttonReset.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75, [System.Int32]23))
    $buttonReset.TabIndex = [System.Int32]18
    $buttonReset.Text = [System.String]'Reset'
    $buttonReset.UseVisualStyleBackColor = $true
    $buttonReset.add_Click($buttonReset_Click)
    #
    #buttonApply
    #
    $buttonApply.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6, [System.Int32]482))
    $buttonApply.Name = [System.String]'buttonApply'
    $buttonApply.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75, [System.Int32]23))
    $buttonApply.TabIndex = [System.Int32]17
    $buttonApply.Text = [System.String]'Apply'
    $buttonApply.UseVisualStyleBackColor = $true
    $buttonApply.add_Click($buttonApply_Click)
    #
    #pictureEnemyTeam
    #
    $pictureEnemyTeam.BackColor = [System.Drawing.Color]::Silver
    $pictureEnemyTeam.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]214, [System.Int32]215))
    $pictureEnemyTeam.Name = [System.String]'pictureEnemyTeam'
    $pictureEnemyTeam.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]150, [System.Int32]150))
    $pictureEnemyTeam.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
    $pictureEnemyTeam.TabIndex = [System.Int32]16
    $pictureEnemyTeam.TabStop = $false
    #
    #pictureHomeTeam
    #
    $pictureHomeTeam.BackColor = [System.Drawing.Color]::Silver
    $pictureHomeTeam.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6, [System.Int32]215))
    $pictureHomeTeam.Name = [System.String]'pictureHomeTeam'
    $pictureHomeTeam.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]150, [System.Int32]150))
    $pictureHomeTeam.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
    $pictureHomeTeam.TabIndex = [System.Int32]15
    $pictureHomeTeam.TabStop = $false
    #
    #labelEnemyTeam
    #
    $labelEnemyTeam.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif', [System.Single]12))
    $labelEnemyTeam.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]214, [System.Int32]162))
    $labelEnemyTeam.Name = [System.String]'labelEnemyTeam'
    $labelEnemyTeam.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]127, [System.Int32]23))
    $labelEnemyTeam.TabIndex = [System.Int32]14
    $labelEnemyTeam.Text = [System.String]'Enemy Team'
    $labelEnemyTeam.add_Click($Label7_Click)
    #
    #selectEnemyImage
    #
    $selectEnemyImage.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif', [System.Single]9))
    $selectEnemyImage.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]214, [System.Int32]185))
    $selectEnemyImage.Name = [System.String]'selectEnemyImage'
    $selectEnemyImage.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]150, [System.Int32]23))
    $selectEnemyImage.TabIndex = [System.Int32]13
    $selectEnemyImage.Text = [System.String]'Select Image'
    $selectEnemyImage.UseVisualStyleBackColor = $true
    $selectEnemyImage.add_Click($selectEnemyImage_Click)
    #
    #labelHomeTeam
    #
    $labelHomeTeam.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif', [System.Single]12))
    $labelHomeTeam.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6, [System.Int32]162))
    $labelHomeTeam.Name = [System.String]'labelHomeTeam'
    $labelHomeTeam.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100, [System.Int32]23))
    $labelHomeTeam.TabIndex = [System.Int32]12
    $labelHomeTeam.Text = [System.String]'Home Team'
    #
    #selectHomeTeamImage
    #
    $selectHomeTeamImage.FormattingEnabled = $true
    $selectHomeTeamImage.Items.AddRange([System.Object[]]@([System.String]'Team BOB', [System.String]'Team BBY'))
    $selectHomeTeamImage.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6, [System.Int32]188))
    $selectHomeTeamImage.Name = [System.String]'selectHomeTeamImage'
    $selectHomeTeamImage.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]150, [System.Int32]21))
    $selectHomeTeamImage.TabIndex = [System.Int32]11
    $selectHomeTeamImage.add_SelectedIndexChanged($selectHomeTeamImage_SelectedIndexChanged)
    $selectHomeTeamImage.SelectedIndex = 0
    #
    #labelMatchup
    #
    $labelMatchup.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif', [System.Single]12, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte][System.Byte]0)))
    $labelMatchup.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]214, [System.Int32]108))
    $labelMatchup.Name = [System.String]'labelMatchup'
    $labelMatchup.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100, [System.Int32]23))
    $labelMatchup.TabIndex = [System.Int32]6
    $labelMatchup.Text = [System.String]'Matchup'
    $labelMatchup.add_Click($Label5_Click)
    #
    #labelGameday
    #
    $labelGameday.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif', [System.Single]12))
    $labelGameday.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]214, [System.Int32]83))
    $labelGameday.Name = [System.String]'labelGameday'
    $labelGameday.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100, [System.Int32]23))
    $labelGameday.TabIndex = [System.Int32]5
    $labelGameday.Text = [System.String]'Gameday'
    $labelGameday.add_Click($Label3_Click)
    #
    #labelTournament
    #
    $labelTournament.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif', [System.Single]12, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte][System.Byte]0)))
    $labelTournament.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]214, [System.Int32]56))
    $labelTournament.Name = [System.String]'labelTournament'
    $labelTournament.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100, [System.Int32]23))
    $labelTournament.TabIndex = [System.Int32]4
    $labelTournament.Text = [System.String]'Tournament'
    $labelTournament.add_Click($Label2_Click)
    #
    #setMatchup
    #
    $setMatchup.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6, [System.Int32]108))
    $setMatchup.Multiline = $true
    $setMatchup.Name = [System.String]'setMatchup'
    $setMatchup.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]202, [System.Int32]21))
    $setMatchup.TabIndex = [System.Int32]3
    #
    #setGameday
    #
    $setGameday.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6, [System.Int32]81))
    $setGameday.Name = [System.String]'setGameday'
    $setGameday.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]202, [System.Int32]21))
    $setGameday.TabIndex = [System.Int32]2
    #
    #labelMatchupTitle
    #
    $labelMatchupTitle.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif', [System.Single]20.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte][System.Byte]0)))
    $labelMatchupTitle.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6, [System.Int32]6))
    $labelMatchupTitle.Name = [System.String]'labelMatchupTitle'
    $labelMatchupTitle.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]462, [System.Int32]42))
    $labelMatchupTitle.TabIndex = [System.Int32]1
    $labelMatchupTitle.Text = [System.String]'MATCHPAGE CONTROL PANEL'
    #
    #selectTournament
    #
    $selectTournament.FormattingEnabled = $true
    $selectTournament.Items.AddRange([System.Object[]]@([System.String]'Primeleague', [System.String]'Custom'))
    $selectTournament.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6, [System.Int32]54))
    $selectTournament.Name = [System.String]'selectTournament'
    $selectTournament.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]202, [System.Int32]21))
    $selectTournament.TabIndex = [System.Int32]0
    $selectTournament.add_SelectedIndexChanged($selectTournament_SelectedIndexChanged)
    $selectTournament.SelectedIndex = 0
    #
    #pagePlayerSpotlight
    #
    $pagePlayerSpotlight.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]4, [System.Int32]22))
    $pagePlayerSpotlight.Name = [System.String]'pagePlayerSpotlight'
    $pagePlayerSpotlight.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]3))
    $pagePlayerSpotlight.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]752, [System.Int32]511))
    $pagePlayerSpotlight.TabIndex = [System.Int32]1
    $pagePlayerSpotlight.Text = [System.String]'Player Spotlight'
    $pagePlayerSpotlight.UseVisualStyleBackColor = $true
    #
    #pageComingSoon
    #
    $pageComingSoon.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]4, [System.Int32]22))
    $pageComingSoon.Name = [System.String]'pageComingSoon'
    $pageComingSoon.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]752, [System.Int32]511))
    $pageComingSoon.TabIndex = [System.Int32]2
    $pageComingSoon.Text = [System.String]'Coming Soon ...'
    $pageComingSoon.UseVisualStyleBackColor = $true
    #
    #setCustomTournament
    #
    $setCustomTournament.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]320, [System.Int32]54))
    $setCustomTournament.Name = [System.String]'setCustomTournament'
    $setCustomTournament.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]148, [System.Int32]21))
    $setCustomTournament.TabIndex = [System.Int32]19
    $setCustomTournament.add_TextChanged($setCustomTournament_TextChanged)
    #
    #PageControls
    #
    $PageControls.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]784, [System.Int32]561))
    $PageControls.Controls.Add($pagesControl)
    $PageControls.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $PageControls.MaximizeBox = $false
    $PageControls.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
    $PageControls.Text = [System.String]'PageControls'
    $pagesControl.ResumeLayout($false)
    $pageMatchup.ResumeLayout($false)
    $pageMatchup.PerformLayout()
([System.ComponentModel.ISupportInitialize]$pictureEnemyTeam).EndInit()
([System.ComponentModel.ISupportInitialize]$pictureHomeTeam).EndInit()
    $PageControls.ResumeLayout($false)
    Add-Member -InputObject $PageControls -Name pagesControl -Value $pagesControl -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name pageMatchup -Value $pageMatchup -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name setCustomTournament -Value $setCustomTournament -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name buttonReset -Value $buttonReset -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name buttonApply -Value $buttonApply -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name pictureEnemyTeam -Value $pictureEnemyTeam -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name pictureHomeTeam -Value $pictureHomeTeam -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name labelEnemyTeam -Value $labelEnemyTeam -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name selectEnemyImage -Value $selectEnemyImage -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name labelHomeTeam -Value $labelHomeTeam -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name selectHomeTeamImage -Value $selectHomeTeamImage -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name labelMatchup -Value $labelMatchup -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name labelGameday -Value $labelGameday -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name labelTournament -Value $labelTournament -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name setMatchup -Value $setMatchup -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name setGameday -Value $setGameday -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name labelMatchupTitle -Value $labelMatchupTitle -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name selectTournament -Value $selectTournament -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name pagePlayerSpotlight -Value $pagePlayerSpotlight -MemberType NoteProperty
    Add-Member -InputObject $PageControls -Name pageComingSoon -Value $pageComingSoon -MemberType NoteProperty
}
. InitializeComponent
