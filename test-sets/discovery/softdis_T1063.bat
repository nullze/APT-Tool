@ECHO OFF

ECHO ===========================================================================
ECHO Security Software Discovery - T1063
ECHO Adversaries may attempt to get a listing of security software, configurations, defensive tools, and sensors that are installed on the system.

netsh.exe advfirewall firewall show all profiles
tasklist.exe
tasklist.exe | findstr /i virus
tasklist.exe | findstr /i cb
tasklist.exe | findstr /i defender
tasklist.exe | findstr /i cylance
