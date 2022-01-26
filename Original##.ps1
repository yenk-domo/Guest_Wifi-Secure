#copy of the program
Copy-Item -Path "C:\Users\$env:username\Desktop\SecureWifi.exe" -Destination "C:\Program Files\Securewifi\Securewifi.exe"
Copy-Item -Path "C:\Users\$env:Username\Desktop\sw1_ico.ico" -Destination "C:\Program Files\Securewifi\sw1_ico.ico"
Copy-Item -Path "C:\Users\$env:Username\Desktop\swnew.png" -Destination "C:\Program Files\Securewifi\swnew.png"


#Startup
Copy-Item -Path "C:\Users\$env:username\Desktop\SecureWifi.exe" -Destination "C:\Users\$env:USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\SecureWifi.exe"

#Get the date of today
$today = (get-date);

Function ErrorDateInfo
{
	[Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
	$form = New-Object Windows.Forms.Form
	$form.Size = New-Object Drawing.Point 1230, 830
	$form.text = "Secure Wifi INFORMATION" #Titre de la fen?tre.
	$form.ControlBox = 1 #Affiche les contr?les (haut/droite).
	$form.MaximizeBox = 1 #Active le contr?le Agrandir (haut/droite).
	$form.MinimizeBox = 1 #Active le contr?le R?duire (haut/droite).
	$form.ShowIcon = 1 #Affiche l'icone (haut/gauche).
	$form.ShowInTaskbar = 1 #Affiche la fen?tre dans la bar des t?ches.
	$form.TopMost = 1 #Affiche la fen?tre toujours au premier plan.
	$form.backcolor = "white" #Couleur du fond de la fen?tre.
	$form.FormBorderStyle = "Sizable" #Style du bord de la fen?tre*.
	$form.StartPosition = "CenterParent"
	
	#Charge une image de fond dans la fen?tre
	$form.BackgroundImage = [system.drawing.image]::FromFile("C:\Program Files\Securewifi\swnew.png")
	$form.BackgroundImageLayout = 0 #Mode d'affichage de l'image**.
	
	#Charge une icone personalis?e (en haut ? gauche).
	$form.Icon = [system.drawing.icon]::ExtractAssociatedIcon("C:\Program Files\Securewifi\sw1_ico.ico")
	
	#Configurer la touche ESC pour fermer la fen?tre.
	$form.KeyPreview = $True
	$form.Add_KeyDown({ if ($_.KeyCode -eq "Escape") { $form.Close() } })
	
	# label information
	$objLabel = New-Object System.Windows.Forms.label
	$objLabel.Location = New-Object System.Drawing.Size(50, 100)
	$objLabel.Size = New-Object System.Drawing.Size(380, 120)
	$objLabel.BackColor = "Transparent"
	$objLabel.ForeColor = "black"
	$objLabel.Text = "One year has already passed ! 
Please contact GTM 
09-7669878!"
	$objLabel.Font = New-Object System.Drawing.Font("Lucida Console", 18, [System.Drawing.FontStyle]::Regular)
	$Form.Controls.Add($objLabel)
	
	#Affiche le tout.
	$form.ShowDialog()
}

Function ErrorMacInfo
{
	[Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
	$form = New-Object Windows.Forms.Form
	$form.Size = New-Object Drawing.Point 1230, 830
	$form.text = "Secure Wifi INFORMATION" #Titre de la fen?tre.
	$form.ControlBox = 1 #Affiche les contr?les (haut/droite).
	$form.MaximizeBox = 1 #Active le contr?le Agrandir (haut/droite).
	$form.MinimizeBox = 1 #Active le contr?le R?duire (haut/droite).
	$form.ShowIcon = 1 #Affiche l'icone (haut/gauche).
	$form.ShowInTaskbar = 1 #Affiche la fen?tre dans la bar des t?ches.
	$form.TopMost = 1 #Affiche la fen?tre toujours au premier plan.
	$form.backcolor = "white" #Couleur du fond de la fen?tre.
	$form.FormBorderStyle = "Sizable" #Style du bord de la fen?tre*.
	$form.StartPosition = "CenterParent"
	
	#Charge une image de fond dans la fen?tre
	$form.BackgroundImage = [system.drawing.image]::FromFile("C:\Program Files\Securewifi\swnew.png")
	$form.BackgroundImageLayout = 0 #Mode d'affichage de l'image**.
	
	#Charge une icone personalis?e (en haut ? gauche).
	$form.Icon = [system.drawing.icon]::ExtractAssociatedIcon("C:\Program Files\Securewifi\sw1_ico.ico")
	
	#Configurer la touche ESC pour fermer la fen?tre.
	$form.KeyPreview = $True
	$form.Add_KeyDown({ if ($_.KeyCode -eq "Escape") { $form.Close() } })
	
	# label information
	$objLabel = New-Object System.Windows.Forms.label
	$objLabel.Location = New-Object System.Drawing.Size(50, 100)
	$objLabel.Size = New-Object System.Drawing.Size(380, 120)
	$objLabel.BackColor = "Transparent"
	$objLabel.ForeColor = "black"
	$objLabel.Text = "You are using a new mac address ! 
Please contact GTM 
09-7669878 !"
	$objLabel.Font = New-Object System.Drawing.Font("Lucida Console", 18, [System.Drawing.FontStyle]::Regular)
	$Form.Controls.Add($objLabel)
	
	#Affiche le tout.
	$form.ShowDialog()
}

Function TrayBalloon
{
	#Load the required assemblies
	[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") #Remove any registered events related to notifications
	Remove-Event BalloonClicked_event -ea SilentlyContinue
	Unregister-Event -SourceIdentifier BalloonClicked_event -ea silentlycontinue
	Remove-Event BalloonClosed_event -ea SilentlyContinue
	Unregister-Event -SourceIdentifier BalloonClosed_event -ea silentlycontinue #Create the notification object
	$notification = New-Object System.Windows.Forms.NotifyIcon
	#Define the icon for the system tray
	$notification.Icon = "C:\Program Files\SecureWifi\sw1_ico.ico"
	
	#Display title of balloon window
	$notification.BalloonTipTitle = "Secure WLAN/LAN"
	
	#Type of balloon icon
	$notification.BalloonTipIcon = "Info"
	
	#Notification message
	$title = "Secure Wifi installed."
	$notification.BalloonTipText = $title
	
	#Make balloon tip visible when called
	$notification.Visible = $True
	
	#Call the balloon notification
	$notification.ShowBalloonTip(600)
}

Function AdapterSwitcher
{
	$serialbios = (gwmi win32_bios).SerialNumber;
	TrayBalloon
	While ($true)
	{
		#Network Adapter UP
		$UP = Get-NetAdapter | where-object { $_.Status -contains "Up" }
		#$LAN = Get-NetAdapter -Physical | Where-Object PhysicalMediaType -ne 'Native 802.11' | Where-Object {$_.Status -contains "Up" }
		#$LANVirutal = Get-NetAdapter | where-object { $_.Status -contains "Up" } | Where-Object { $_.PhysicalMediaType -eq "802.3" -and { $_.Name -notlike "PANGP" } }
		#$Wifi = Get-NetAdapter | Where-Object PhysicalMediaType -eq 'Native 802.11' | Where-Object {$_.Status -contains "Up" }
		#$virtual = (Get-NetAdapter -InterfaceDescription *Virtual* | ? status -eq "UP") 
		#$LANWifi = Get-NetAdapter -Physical | where-object { $_.Status -contains "Up" } 
		
		
		#Database
		$data = @(
			[pscustomobject]@{ Number = '1'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # LAN 
			[pscustomobject]@{ Number = '2'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # LAN
			[pscustomobject]@{ Number = '3'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # LAN
			[pscustomobject]@{ Number = '4'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # LAN
			[pscustomobject]@{ Number = '5'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # Wifi
			[pscustomobject]@{ Number = '6'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # Wifi
			[pscustomobject]@{ Number = '7'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # Wifi
			[pscustomobject]@{ Number = '8'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # VPN
			[pscustomobject]@{ Number = '9'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # VPN
			[pscustomobject]@{ Number = '10'; Name = '0'; Mac = ''; Wifi = ''; Lan = ''; VPN = ''; Bluetooth = ''; Approve = '' } # VPN
			
		)
		
		
		#Array LAN
		$macadressLan0 = (Get-NetAdapter -Physical | Where-Object PhysicalMediaType -ne 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).MacAddress | Select-Object -index 0
		$macadressLan1 = (Get-NetAdapter -Physical | Where-Object PhysicalMediaType -ne 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).MacAddress | Select-Object -index 1
		$macadressLan2 = (Get-NetAdapter -Physical | Where-Object PhysicalMediaType -ne 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).MacAddress | Select-Object -index 2
		$macadressLan3 = (Get-NetAdapter -Physical | Where-Object PhysicalMediaType -ne 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).MacAddress | Select-Object -index 3
		$DescriptionLan0 = (Get-NetAdapter -Physical | Where-Object PhysicalMediaType -ne 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).InterfaceDescription | Select-Object -index 0
		$DescriptionLan1 = (Get-NetAdapter -Physical | Where-Object PhysicalMediaType -ne 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).InterfaceDescription | Select-Object -index 1
		$DescriptionLan2 = (Get-NetAdapter -Physical | Where-Object PhysicalMediaType -ne 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).InterfaceDescription | Select-Object -index 2
		$DescriptionLan3 = (Get-NetAdapter -Physical | Where-Object PhysicalMediaType -ne 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).InterfaceDescription | Select-Object -index 3
		$card = 0
		if ($macadressLan0 -ne $null)
		{
			$data[0].Mac = $macadressLan0
			$data[0].Name = $DescriptionLan0
			$data[0].Lan = '1'
			$card++
			if ($macadressLan1 -ne $null)
			{
				$data[1].Mac = $macadressLan1
				$data[1].Name = $DescriptionLan1
				$data[1].Lan = '1'
				$card++
				if ($macadressLan2 -ne $null)
				{
					$data[2].Mac = $macadressLan1
					$data[2].Name = $DescriptionLan1
					$data[2].Lan = '1'
					$card++
					if ($macadressLan3 -ne $null)
					{
						$data[3].Mac = $macadressLan1
						$data[3].Name = $DescriptionLan1
						$data[3].Lan = '1'
						$card++
					}
				}
			}
			
		}
		
		#Array Wifi
		$macadressWifi0 = (Get-NetAdapter | Where-Object PhysicalMediaType -eq 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).MacAddress | Select-Object -index 0
		$macadressWifi1 = (Get-NetAdapter | Where-Object PhysicalMediaType -eq 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).MacAddress | Select-Object -index 1
		$macadressWifi2 = (Get-NetAdapter | Where-Object PhysicalMediaType -eq 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).MacAddress | Select-Object -index 2
		$DescriptionWifi0 = (Get-NetAdapter | Where-Object PhysicalMediaType -eq 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).InterfaceDescription | Select-Object -index 0
		$DescriptionWifi1 = (Get-NetAdapter | Where-Object PhysicalMediaType -eq 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).InterfaceDescription | Select-Object -index 1
		$DescriptionWifi2 = (Get-NetAdapter | Where-Object PhysicalMediaType -eq 'Native 802.11' | Where-Object { $_.Status -contains "Up" }).InterfaceDescription | Select-Object -index 2
		if ($macadressWifi0 -ne $null)
		{
			$data[4].Mac = $macadressWifi0
			$data[4].Name = $DescriptionWifi0
			$data[4].Wifi = '1'
			$card++
			if ($macadressWifi1 -ne $null)
			{
				$data[5].Mac = $macadressWifi1
				$data[5].Name = $DescriptionWifi1
				$data[5].Wifi = '1'
				$card++
				if ($macadressWifi2 -ne $null)
				{
					$data[6].Mac = $macadressWifi2
					$data[6].Name = $DescriptionWifi2
					$data[6].Wifi = '1'
					$card++
				}
			}
			
		}
		
		#Array VPN
		$macadressVPN0 = (Get-NetAdapter -InterfaceDescription *Virtual* | ? status -eq "UP").MacAddress | Select-Object -index 0
		$macadressVPN1 = (Get-NetAdapter -InterfaceDescription *Virtual* | ? status -eq "UP").MacAddress | Select-Object -index 1
		$macadressVPN2 = (Get-NetAdapter -InterfaceDescription *Virtual* | ? status -eq "UP").MacAddress | Select-Object -index 2
		$DescriptionVPN0 = (Get-NetAdapter -InterfaceDescription *Virtual* | ? status -eq "UP").Interfacedescription | Select-Object -index 0
		$DescriptionVPN1 = (Get-NetAdapter -InterfaceDescription *Virtual* | ? status -eq "UP").Interfacedescription | Select-Object -index 1
		$DescriptionVPN2 = (Get-NetAdapter -InterfaceDescription *Virtual* | ? status -eq "UP").Interfacedescription | Select-Object -index 2
		if ($macadressVPN0 -ne $null)
		{
			$data[7].Mac = $macadressVPN0
			$data[7].Name = $DescriptionVPN0
			$data[7].VPN = '1'
			$card++
			if ($macadressVPN1 -ne $null)
			{
				$data[8].Mac = $macadressVPN1
				$data[8].Name = $DescriptionVPN1
				$data[8].VPN = '1'
				$card++
				if ($macadressVPN2 -ne $null)
				{
					$data[9].Mac = $macadressVPN2
					$data[9].Name = $DescriptionVPN2
					$data[9].VPN = '1'
					$card++
				}
			}
			
		}
		
		#Verification Macadress1 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress1 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count1++
					}
				}
			}
		}
		
		#Verification Macadress2 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress2 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count2++
					}
				}
			}
		}
		#Verification Macadress3 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress3 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count3++
					}
				}
			}
		}
		
		#Verification Macadress4 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress4 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count4++
					}
				}
			}
		}
		
		#Verification Macadress5 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress5 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count4++
					}
				}
			}
		}
		
		#Verification Macadress6 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress6 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count4++
					}
				}
			}
		}
		
		#Verification Macadress7 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress7 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count4++
					}
				}
			}
		}
		
		#Verification Macadress8 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress8 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count4++
					}
				}
			}
		}
		
		#Verification Macadress9 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress9 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count4++
					}
				}
			}
		}
		
		#Verification Macadress10 legal with all UP
		foreach ($num in 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($adress10 -eq $data[$num].Mac)
				{
					$data[$num].Approve = '1'
				}
				else
				{
					if ($data[$num].Approve -ne '1')
					{
						$data[$num].Approve = '0'
						$count4++
					}
				}
			}
		}
		
		#Disable only LAN if not approve
		foreach ($num in 0, 1, 2, 3)
		{
			if ($data[$num].Name -ne '0')
			{
				if ($data[$num].Approve -eq '0')
				{
					$test = $data[$num].Name
					Disable-Netadapter -Interfacedescription $test -Confirm:$false
					ErrorMacInfo
					$data[$num].Lan = '0'
				}
			}
			
		}
		
		#Enable all network Wifi
		Function EnableWifi
		{
			$WiFiNetadapter = Get-Netadapter | Where-Object { $_.PhysicalMediaType -eq "Native 802.11" }
			$WiFiNetadapter | Enable-NetAdapter -Confirm:$false -Verbose;
		}
		
		#Disable all Network Wifi
		Function DisableWifi
		{
			$WiFiNetadapter = Get-Netadapter | Where-Object { $_.PhysicalMediaType -eq "Native 802.11" }
			$WiFiNetadapter | Disable-NetAdapter -Confirm:$false -Verbose;
		}
		
		#Status LAN and WIFI 
		if ((($data[0].Lan -eq '1') -or ($data[1].Lan -eq '1') -or ($data[2].Lan -eq '1') -or ($data[3].Lan -eq '1')) -and (($data[4].Wifi -eq '1') -or ($data[5].Wifi -eq '1') -or ($data[6].Wifi -eq '1')))
		{
			DisableWifi
			$data[4].Wifi = '0'
			$data[5].Wifi = '0'
			$data[6].Wifi = '0'
		}
		else
		{
			if (($data[0].Lan -ne '1') -and ($data[1].Lan -ne '1') -and ($data[2].Lan -ne '1') -and ($data[3].Lan -ne '1'))
			{
				EnableWifi
				$data[4].Wifi = '1'
				$data[5].Wifi = '1'
				$data[6].Wifi = '1'
			}
		}
		Start-Sleep -s 3
	}
	$WiFiNetadapter = get-netadapter | Where-Object { $_.PhysicalMediaType -eq "Native 802.11" }
	$WiFiNetadapter | Enable-NetAdapter -Confirm:$false -Verbose;
}

#Check day of today
if ($today -le $Enddate)
{
	AdapterSwitcher
}
else
{
	ErrorDateInfo
}
