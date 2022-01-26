

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

# form specs
$objForm = New-Object System.Windows.Forms.Form
$objForm.Text = "Check Network Status"
$objForm.Size = New-Object System.Drawing.Size(1230, 830)
$objForm.ControlBox = 1
$objForm.MaximizeBox = 1
$objForm.MinimizeBox = 1
$objForm.ShowIcon = 1
$objForm.ShowInTaskbar = 1
$objForm.TopMost = 1
$objForm.BackColor = "white"
$objForm.FormBorderStyle = "Sizable"
$objForm.StartPosition = "CenterScreen"
$objForm.KeyPreview = $True
$objForm.MaximumSize = $objForm.Size
$objForm.MinimumSize = $objForm.Size

#Disable Wifi
#$WiFiNetadapter = get-netadapter | Where-Object { $_.PhysicalMediaType -eq "Native 802.11" }
#$WiFiNetadapter | Disable-NetAdapter -Confirm:$false -Verbose;

# form icon
$objIcon = New-Object system.drawing.icon ("C:\Users\$env:USERNAME\Desktop\sw1_ico.ico")
$objForm.Icon = $objIcon

#JPG background  
$objImage = [system.drawing.image]::FromFile("C:\Users\$env:USERNAME\Desktop\swnew.png")
$objForm.BackgroundImage = $objImage
$objForm.BackgroundImageLayout = "None"
# None, Tile, Center, Stretch, Zoom

$objForm.Width = $objImage.Width
$objForm.Height = $objImage.Height


# label compagny name
$objLabel = New-Object System.Windows.Forms.label
$objLabel.Location = New-Object System.Drawing.Size(25, 50)
$objLabel.Size = New-Object System.Drawing.Size(260, 20)
$objLabel.BackColor = "Transparent"
$objLabel.ForeColor = "black"
$objLabel.Text = "Enter Compagny Name: "
$objLabel.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objForm.Controls.Add($objLabel)

# input box compagny name
$objTextbox = New-Object System.Windows.Forms.TextBox
$objTextbox.Location = New-Object System.Drawing.Size(290, 47)
$objTextbox.Size = New-Object System.Drawing.Size(200, 20)
$objTextbox.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objForm.Controls.Add($objTextbox)

# label number computer
$objLabel1 = New-Object System.Windows.Forms.label
$objLabel1.Location = New-Object System.Drawing.Size(25, 90)
$objLabel1.Size = New-Object System.Drawing.Size(500, 20)
$objLabel1.BackColor = "Transparent"
$objLabel1.ForeColor = "black"
$objLabel1.Text = "Enter the number written on the GTM label: "
$objLabel1.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objForm.Controls.Add($objLabel1)

# input box number computer
$objTextbox1 = New-Object System.Windows.Forms.TextBox
$objTextbox1.Location = New-Object System.Drawing.Size(27, 120)
$objTextbox1.Size = New-Object System.Drawing.Size(200, 20)
$objTextbox1.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objForm.Controls.Add($objTextbox1)

# label mail
$objLabel2 = New-Object System.Windows.Forms.label
$objLabel2.Location = New-Object System.Drawing.Size(25, 160)
$objLabel2.Size = New-Object System.Drawing.Size(230, 15)
$objLabel2.BackColor = "Transparent"
$objLabel2.ForeColor = "black"
$objLabel2.Text = "Enter Your E-Mail: "
$objLabel2.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objForm.Controls.Add($objLabel2)

# input box mail
$objTextbox2 = New-Object System.Windows.Forms.TextBox
$objTextbox2.Location = New-Object System.Drawing.Size(260, 155)
$objTextbox2.Size = New-Object System.Drawing.Size(250, 20)
$objTextbox2.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objForm.Controls.Add($objTextbox2)

# label cable1
$objLabel3 = New-Object System.Windows.Forms.label
$objLabel3.Location = New-Object System.Drawing.Size(25, 260)
$objLabel3.Size = New-Object System.Drawing.Size(300, 20)
$objLabel3.BackColor = "Transparent"
$objLabel3.ForeColor = "Black"
$objLabel3.Text = "Recovery of all networks"
$objLabel3.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objForm.Controls.Add($objLabel3)

# action item here - you could add your own actions
$button_click =
{
	$returnStatus.Text = ""
	$objStatusBar.Text = "Checking status..."
	$mac1 = (Get-NetAdapter).MacAddress | Select-Object -index 0
	$mac2 = (Get-NetAdapter).MacAddress | Select-Object -index 1
	$mac3 = (Get-NetAdapter).MacAddress | Select-Object -index 2
	$mac4 = (Get-NetAdapter).MacAddress | Select-Object -index 3
	$mac5 = (Get-NetAdapter).MacAddress | Select-Object -index 4
	$mac6 = (Get-NetAdapter).MacAddress | Select-Object -index 5
	$mac7 = (Get-NetAdapter).MacAddress | Select-Object -index 6
	$mac8 = (Get-NetAdapter).MacAddress | Select-Object -index 7
	$mac9 = (Get-NetAdapter).MacAddress | Select-Object -index 8
	$mac10 = (Get-NetAdapter).MacAddress | Select-Object -index 9
	
	if ($mac1 -ne $null)
	{
		$returnStatus.BackColor = "Transparent"
		$returnStatus.ForeColor = "Green"
		$returnStatus.Text = "Network Card Fount ! SAVE !"
		New-Item "C:\Program Files" -Name SecureWifi -ItemType "directory" -Force
		$value1 = $mac1
		$file = new-item "C:\Program Files\SecureWifi\mac1.txt" -type file -value "$value1" -Force
		$value2 = "$mac2"
		$file = new-item "C:\Program Files\SecureWifi\mac2.txt" -type file -value "$value2" -Force
		$value3 = "$mac3"
		$file = new-item "C:\Program Files\SecureWifi\mac3.txt" -type file -value "$Value3" -Force
		$value4 = "$mac4"
		$file = new-item "C:\Program Files\SecureWifi\mac4.txt" -type file -value "$Value4" -Force
		$value5 = "$mac5"
		$file = new-item "C:\Program Files\SecureWifi\mac5.txt" -type file -value "$Value5" -Force
		$value6 = "$mac6"
		$file = new-item "C:\Program Files\SecureWifi\mac6.txt" -type file -value "$Value6" -Force
		$value7 = "$mac7"
		$file = new-item "C:\Program Files\SecureWifi\mac7.txt" -type file -value "$Value7" -Force
		$value8 = "$mac8"
		$file = new-item "C:\Program Files\SecureWifi\mac8.txt" -type file -value "$Value8" -Force
		$value9 = "$mac9"
		$file = new-item "C:\Program Files\SecureWifi\mac9.txt" -type file -value "$Value9" -Force
		$value10 = "$mac10"
		$file = new-item "C:\Program Files\SecureWifi\mac10.txt" -type file -value "$value10" -Force
	}
	Else
	{
		$returnStatus.ForeColor = "Red"
		$returnStatus.Text = "No network card was found"
		
	}
	$objStatusBar.Text = "Done"
}

# Check1 button
$objButton = New-Object System.Windows.Forms.Button
$objButton.Location = New-Object System.Drawing.Size(330, 255)
$objButton.Size = New-Object System.Drawing.Size(100, 28)
$objButton.Text = "Check"
$objButton.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objButton.Add_Click($button_click)
$objForm.Controls.Add($objButton)


$button_click =
{
	$compagnyname = $objTextbox.Text
	$numbercomputer = $objTextbox1.Text
	$mail = $objTextbox2.Text
	
	
	if ((!$compagnyname) -or (!$numbercomputer) -or (!$mail))
	{
		
		$returnStatus.BackColor = "Transparent"
		$returnStatus.ForeColor = "Red"
		$returnStatus.Text = "Complet all the fields! If the problem persists contact GTM."
		
	}
	else
	{
		if (!(Test-Path -Path "C:\Program files\SecureWifi\mac1.txt"))
		{
			$returnStatus.BackColor = "Transparent"
			$returnStatus.ForeColor = "Red"
			$returnStatus.Text = "Click on check ! If the problem persists contact GTM."
		}
		else
		{
			$mac1 = Get-Content "C:\Program files\SecureWifi\mac1.txt"
			$mac2 = Get-Content "C:\Program files\SecureWifi\mac2.txt"
			$mac3 = Get-Content "C:\Program files\SecureWifi\mac3.txt"
			$mac4 = Get-Content "C:\Program files\SecureWifi\mac4.txt"
			$mac5 = Get-Content "C:\Program files\SecureWifi\mac5.txt"
			$mac6 = Get-Content "C:\Program files\SecureWifi\mac6.txt"
			$mac7 = Get-Content "C:\Program files\SecureWifi\mac7.txt"
			$mac8 = Get-Content "C:\Program files\SecureWifi\mac8.txt"
			$mac9 = Get-Content "C:\Program files\SecureWifi\mac9.txt"
			$mac10 = Get-Content "C:\Program files\SecureWifi\mac10.txt"
			$serial = 9990;
			$env:HostIP = (
				Get-NetIPConfiguration |
				Where-Object {
					$_.IPv4DefaultGateway -ne $null -and
					$_.NetAdapter.Status -ne "Disconnected"
				}).IPv4Address.IPAddress
			$Date = Get-Date -format d;
			$Bios = (gwmi win32_bios).SerialNumber;
			$Value = "File create to`n$Date`nCompagny name:`n$compagnyname`ncomputer number:`n$numbercomputer`nMail:`n$mail`nSerialBios:`n$Bios`nSerial:`n$serial`nComputer name:`n$env:COMPUTERNAME`nIP adress:`n$env:HostIP`nMac Adress:`n$mac1`n$mac2`n$mac3`n$mac4`n$mac5`n$mac6`n$mac7`n$mac8`n$mac9`n$mac10";
			$file = new-item "C:\Program Files\SecureWifi\GTM.txt" -type file -value "$Value" -Force;
			
			#Upload the file to the FTPServer
			$client = New-Object System.Net.WebClient;
			$client.UploadFile("ftp://UserFTP:Gtm2020Gtm@84.228.11.219/WifiSecure/GTM.txt", "C:\Program Files\SecureWifi\GTM.txt");
			
			$returnStatus.BackColor = "Transparent"
			$returnStatus.ForeColor = "Green"
			$returnStatus.Text = "Complet !! Check Your Mail"
			Start-Sleep -s 4;
			$objForm.Close();
		}
	}
	
	
}

# Send button
$objButton2 = New-Object System.Windows.Forms.Button
$objButton2.Location = New-Object System.Drawing.Size(200, 450)
$objButton2.Size = New-Object System.Drawing.Size(80, 28)
$objButton2.Text = "Send"
$objButton2.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objButton2.Add_Click($button_click)
$objForm.Controls.Add($objButton2)


# return status
$returnStatus = New-Object System.Windows.Forms.label
$returnStatus.Location = New-Object System.Drawing.Size(50, 390)
$returnStatus.Size = New-Object System.Drawing.Size(430, 52)
$returnStatus.BackColor = "Transparent"
$returnStatus.Text = ""
$returnStatus.Font = New-Object System.Drawing.Font("Lucida Console", 14, [System.Drawing.FontStyle]::Regular)
$objForm.Controls.Add($returnStatus)
	
 
# form status bar  
$objStatusBar = New-Object System.Windows.Forms.StatusBar
$objStatusBar.Name = "statusBar"
$objStatusBar.Text = "Ready"
$objForm.Controls.Add($objStatusBar)
   
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter"){&amp; $button_click}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape")
{$objForm.Close()}})
   
# modal
$objForm.Topmost = $True
$objForm.Add_Shown({$objForm.Activate()})
[void] $objForm.ShowDialog()

#Enable Wifi
#$WiFiNetadapter | Enable-NetAdapter -Confirm:$false -Verbose;