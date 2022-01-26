

while ($true)
{
    
    $countfile = (dir C:\Users\admin\Desktop\FileFTP\WifiSecure | Measure-Object).Count;
    
    if ($countfile -eq 1)
    {
        #Reception all elements
        $date = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 1;
		(Get-Culture).textinfo.totitlecase([string]$date);
        $compagnyname = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 3;
		(Get-Culture).textinfo.totitlecase([string]$compagnyname.replace(' ',''));
		$numbercomputer = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 5;
        [string]$numbercomputer.replace(' ','');
        $Mail = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 7;
		[string]$Mail.replace(' ', '');
		[string]$serialbios = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 9;
		[string]$serial = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 11;
		[string]$computername = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 13;
		[string]$ip = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 15;
		[string]$Macadress = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 17;
		[string]$Macadress2 = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 18;
		[string]$Macadress3 = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 19;
		[string]$Macadress4 = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 20;
		[string]$Macadress5 = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 21;
		[string]$Macadress6 = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 22;
		[string]$Macadress7 = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 23;
		[string]$Macadress8 = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 24;
		[string]$Macadress9 = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 25;
		[string]$Macadress10 = Get-Content "C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt" | where { $_ -ne "$null" } | Select-Object -Index 26;
		
		
		#Create folder Customer
		$checkcomp = Test-Path "C:\Users\admin\Desktop\GTMcostumer\$compagnyname";
		$checknum = Test-Path "C:\Users\admin\Desktop\GTMcostumer\$compagnyname\$numbercomputer";
		If (($checkcomp -ne $true) -and ($checknum -ne $true))
		{
			New-Item -Path "C:\Users\admin\Desktop\GTMcostumer" -Name $compagnyname -ItemType "directory";
			New-Item -Path "C:\Users\admin\Desktop\GTMcostumer\$compagnyname" -Name $numbercomputer -ItemType "directory";
		}
		else
		{
			if ($checknum -ne $true)
			{
				New-Item -Path "C:\Users\admin\Desktop\GTMcostumer\$compagnyname" -Name $numbercomputer -ItemType "directory";
			}
		}
		
		#Move txt in Customer
        Move-Item -Path  C:\Users\admin\Desktop\FileFTP\WifiSecure\GTM.txt -Destination C:\Users\admin\Desktop\GTMcostumer\$compagnyname\$numbercomputer -force;
		
		#Check serial existing
		$checkserial = Test-Path C:\Users\admin\Desktop\FileFTP\List\$serial
		if ($checkserial -eq $false)
		{
			
			New-Item -Path C:\Users\admin\Desktop\FileFTp\List\$serial -ItemType "directory";
			#Copy Secure
			Copy-Item "C:\Users\admin\Desktop\Original.ps1" -Destination "C:\Users\admin\Desktop\Securecopy.ps1";
			
			#Add one year on today's date
			$Enddate = get-date -date $(get-date).addyears(1) -Format dd-MM-yyyy;
			
			#Insertion of first macadress
			$i = 5 #insert à la ligne 5
			$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
			$test_out = "`$adress1 = `"$Macadress`";";
			$a = get-content $filePath;
			$b = $a.count;
			set-content $filePath $a[0..($i - 1)];
			add-content $filePath ("$test_out");
			add-content $filePath $a[$i..$b];
			
			if ($Macadress2)
			{
				#Insertion of second macadress
				$i = 5 #insert à la ligne 5
				$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
				$test_out = "`$adress2 = `"$Macadress2`";";
				$a = get-content $filePath;
				$b = $a.count;
				set-content $filePath $a[0..($i - 1)];
				add-content $filePath ("$test_out");
				add-content $filePath $a[$i..$b];
			}
			
			if ($Macadress2)
			{
				#Insertion of third macadress
				$i = 5 #insert à la ligne 5
				$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
				$test_out = "`$adress3 = `"$macadress3`";";
				$a = get-content $filePath;
				$b = $a.count;
				set-content $filePath $a[0..($i - 1)];
				add-content $filePath ("$test_out");
				add-content $filePath $a[$i..$b];
			}
			
			if ($Macadress3)
			{
				#Insertion of fourth macadress
				$i = 5 #insert à la ligne 5
				$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
				$test_out = "`$adress4 = `"$Macadress4`";";
				$a = get-content $filePath;
				$b = $a.count;
				set-content $filePath $a[0..($i - 1)];
				add-content $filePath ("$test_out");
				add-content $filePath $a[$i..$b];
			}
			
			if ($Macadress4)
			{
				#Insertion of fifth macadress
				$i = 5 #insert à la ligne 5
				$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
				$test_out = "`$adress5 = `"$Macadress5`";";
				$a = get-content $filePath;
				$b = $a.count;
				set-content $filePath $a[0..($i - 1)];
				add-content $filePath ("$test_out");
				add-content $filePath $a[$i..$b];
			}
			
			if ($Macadress5)
			{
				#Insertion of sixth macadress
				$i = 5 #insert à la ligne 5
				$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
				$test_out = "`$adress6 = `"$Macadress6`";";
				$a = get-content $filePath;
				$b = $a.count;
				set-content $filePath $a[0..($i - 1)];
				add-content $filePath ("$test_out");
				add-content $filePath $a[$i..$b];
			}
			
			if ($Macadress6)
			{
				#Insertion of seventh macadress
				$i = 5 #insert à la ligne 5
				$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
				$test_out = "`$adress7 = `"$Macadress7`";";
				$a = get-content $filePath;
				$b = $a.count;
				set-content $filePath $a[0..($i - 1)];
				add-content $filePath ("$test_out");
				add-content $filePath $a[$i..$b];
			}
			
			if ($Macadress7)
			{
				#Insertion of eighth macadress
				$i = 5 #insert à la ligne 5
				$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
				$test_out = "`$adress8 = `"$Macadress8`";";
				$a = get-content $filePath;
				$b = $a.count;
				set-content $filePath $a[0..($i - 1)];
				add-content $filePath ("$test_out");
				add-content $filePath $a[$i..$b];
			}
			
			if ($Macadress8)
			{
				#Insertion of nineth macadress
				$i = 5 #insert à la ligne 5
				$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
				$test_out = "`$adress9 = `"$Macadress9`";";
				$a = get-content $filePath;
				$b = $a.count;
				set-content $filePath $a[0..($i - 1)];
				add-content $filePath ("$test_out");
				add-content $filePath $a[$i..$b];
			}
			
			if ($Macadress9)
			{
				#Insertion of tenth macadress
				$i = 5 #insert à la ligne 5
				$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
				$test_out = "`$adress10 = `"$Macadress10`";";
				$a = get-content $filePath;
				$b = $a.count;
				set-content $filePath $a[0..($i - 1)];
				add-content $filePath ("$test_out");
				add-content $filePath $a[$i..$b];
			}
			
			#Insertion of Serial
			$i = 5 #insert à la ligne 5
			$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
			$test_out = "`$serial = `"$serial`";";
			$a = get-content $filePath;
			$b = $a.count;
			set-content $filePath $a[0..($i - 1)];
			add-content $filePath ("$test_out");
			add-content $filePath $a[$i..$b];
			
			#Insertion of year after installation day
			$i = 5 #insert à la ligne 5
			$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
			$test_out = "`$Enddate = (get-date $Enddate );";
			$a = get-content $filePath;
			$b = $a.count;
			set-content $filePath $a[0..($i - 1)];
			add-content $filePath ("$test_out");
			add-content $filePath $a[$i..$b];
			
			#Insertion of serialBIOS
			$i = 5 #insert à la ligne 5
			$filePath = "C:\Users\Admin\Desktop\Securecopy.ps1";
			$test_out = "`$serbios = `"$serialbios`";";
			$a = get-content $filePath;
			$b = $a.count;
			set-content $filePath $a[0..($i - 1)];
			add-content $filePath ("$test_out");
			add-content $filePath $a[$i..$b];
			
			#Copy ps1 in FolderCustomer
			Copy-Item -Path "C:\Users\admin\Desktop\Securecopy.ps1" -Destination "C:\Users\admin\Desktop\GTMcostumer\$compagnyname\$numbercomputer";
			
			#Create the file bat
			Move-Item "C:\Users\admin\Desktop\Securecopy.ps1" -Destination "C:\Users\admin\Desktop\PS1toEXE" -force;
			
			$1 = "`"callPS2EXE.bat`"";
			$2 = "`"Securecopy.ps1`"";
			$path = "`"SecureWifi.exe`"";
			$3 = "`"wifi.ico`"";
			$test = "call $1 $2 $path -noconsole -iconFile $3";
			New-Item -Path "C:\Users\admin\Desktop\PS1toEXE\createxe.bat" -Value "$test";
			Copy-Item "C:\Users\admin\Desktop\PS1toEXE\Securecopy.ps1" -Destination "C:\Users\admin\Desktop\GTMcostumer\$compagnyname\$numbercomputer";
			
			#Run the bat
			cmd /c "cd `"C:\Users\admin\Desktop\PS1toEXE`"" "&&" "createxe.bat";
			Move-Item -Path C:\Users\admin\desktop\PS1toEXE\Securecopy.ps1 -Destination C:\Users\admin\Desktop\GTMcostumer\$compagnyname\$numbercomputer -Force;
			Move-Item -Path C:\Users\admin\Desktop\PS1toEXE\createxe.bat -Destination C:\Users\admin\Desktop\GTMcostumer\$compagnyname\$numbercomputer -Force;
			<#Copy#>Move-Item C:\Users\admin\Desktop\PS1toEXE\SecureWifi.exe -Destination C:\Users\admin\Desktop\GTMcostumer\$compagnyname\$numbercomputer;
			#Move-Item C:\Users\admin\Desktop\PS1toEXE\SecureWifi.exe -Destination C:\Users\admin\Desktop\FileFTP\DownloadFile -Force;
			Move-Item C:\Users\admin\Desktop\PS1toEXE\SecureWifi.exe.config -Destination C:\Users\admin\Desktop\GTMcostumer\$compagnyname\$numbercomputer -Force;
	
			#EXE to Zip
            $compress = @{
				Path = "C:\Users\admin\Desktop\GTMcostumer\$compagnyname\$numbercomputer\SecureWifi.exe"
            CompressionLevel = "Fastest"
            DestinationPath = "C:\Users\admin\Desktop\FileFTP\DownloadFile\SecureWifi.zip"
            }
            Compress-Archive @compress -force
			#Compress-Archive -Path "C:\Users\admin\Desktop\FileFTP\DownloadFile\SecureWifi.exe" -DestinationPath "C:\Users\admin\Desktop\FileFTP\DownloadFile\SecureWifi.zip" -force
			
			#Send Email to GTM
			$OL = New-Object -ComObject outlook.application;
			Start-Sleep 5;
		
            #Create Item
			$mItem = $OL.CreateItem("olMailItem");
			$mItem.To = "gal@gtm.co.il";
			$mItem.Subject = "Inscription Valid";
			$mItem.Body = "File create to $Date , Compagny name is $compagnyname computer number is $numbercomputer Mail $mail , MACadress $adressmac";
			$mItem.Send();
			
			#Send Email to Customer
			$OL = New-Object -ComObject outlook.application;
			Start-Sleep 5;
			$mItem = $OL.CreateItem("olMailItem");
			$mItem.To = "$Mail";
			$mItem.Subject = "Inscription Valid";
			$mItem.Body = "You can Download your software in this link >>> ftp://GuestFTP:12345@84.228.11.219/DownloadFile/SecureWifi.zip";
			$mItem.Send();
		}
		else
		{
			#Send Email to GTM
			$OL = New-Object -ComObject outlook.application;
			Start-Sleep 5;
			#Create Item
			$mItem = $OL.CreateItem("olMailItem");
			$mItem.To = "gal@gtm.co.il";
			$mItem.Subject = "Inscription Invalid";
			$mItem.Body = "On $Date , This PC tried to re-use the Ask.exe file from $compagnyname computer number is $numbercomputer Mail $mail , MACadress $adressmac, Computername : $computername";
			$mItem.Send();
			
			#Send Email to Customer
			$OL = New-Object -ComObject outlook.application;
			Start-Sleep 5;
			#Create Item
			$mItem = $OL.CreateItem("olMailItem");
			$mItem.To = "$Mail";
			$mItem.Subject = "Inscription";
			$mItem.Body = "Your tried to use the ask program again, this one only works once. Please contact the GTM administrator";
			$mItem.Send();
		}
	}
	Start-Sleep -s 3
}

