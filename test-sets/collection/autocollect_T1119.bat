ECHO ===========================================================================
ECHO WORKING DIRS AND FILES - T1119
ECHO Creating typical attacker working directory %APTDIR% ...
ping -n 5 127.0.0.1 > NUL
MKDIR %APTDIR%
ECHO Dropping typical temporary files into that directory
ping -n 5 127.0.0.1 > NUL
"%ZIP%" e -bb0 -p%PASS% "%FILEARCH%" -aoa -o"%APTDIR%" workfiles\d.txt > NUL
"%ZIP%" e -bb0 -p%PASS% "%FILEARCH%" -aoa -o"%APTDIR%" workfiles\127.0.0.1.txt > NUL
ECHO Utilize Clipboard to store or execute commands from, copying clipboard data to .txt
powershell Get-Clipboard > myfile.txt

ECHO Getting screen-capture and saving to screenshot.png
powershell helpers/sc.exe screenshot.png
