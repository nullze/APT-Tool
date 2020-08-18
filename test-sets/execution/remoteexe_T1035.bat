@ECHO OFF

ECHO ===========================================================================
ECHO Remote Execution Tool - T1035
ECHO Dropping a remote execution tool into the APT Dir (C:\TMP)
ping -n 5 127.0.0.1 > NUL

"%ZIP%" e -p%PASS% "%TOOLARCH%" -aoa -o"%APTDIR%" toolset\xCmd.exe > NUL
