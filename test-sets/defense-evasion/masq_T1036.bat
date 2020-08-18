@ECHO OFF

ECHO ===========================================================================
ECHO Masquerading - T1036
ECHO Masquerading Lsass process and executing
cmd.exe /c copy %SystemRoot%\System32\cmd.exe %SystemRoot%\Temp\lsass.exe
powershell %SystemRoot%\Temp\lsass.exe
