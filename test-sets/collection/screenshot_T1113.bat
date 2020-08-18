ECHO ===========================================================================
ECHO Takes Screenshot - T1119
ECHO Saves screenshot in working directory %APTDIR% ...
ping -n 5 127.0.0.1 > NUL

ECHO Getting screen-capture and saving to screenshot.png
powershell helpers/sc.exe %APTDIR%/screenshot.png
