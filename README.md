# Guest_Wifi-Secure
I'm not a developer just great at googling. don't be mad at me for this heavy but functional code.
Guest wireless LAN is never connected to work LAN.
You don't want your guest network (wifi) and our cable network to be connected on the same devices.

Prerequisite:
1-Install a first FTP server with a user and password.
2-Have an email address to receive the homemade software link.

"Receving##.ps1" must be constantly running waiting for a new installation of "installer agent.ps1"
"installer agent.ps1" is executed on the Windows OS machine concerned. a window opens, complete the questionnaire. After filling in and clicking on DONE a request is sent to the FTP server. Some information about network cards is shared with the server.
Receiving##.ps1 running on the FTP server retrieves this data, prepares a custom code from "Original##.ps1". This Custom Code is simply a copy code from the "original##.ps1" with the network card information embedded.
Then Send an email with the FTP link so that the host can download the code prepared and converted into EXE.
once the EXE is downloaded, you just have to install it on the machine. An icon will appear in the Tray app after this one.
