@ECHO OFF
setlocal EnableDelayedExpansion
color 0C
ECHO.

SET CWD=%~dp0
cd %CWD%

:: Config
SET ZIP=%CWD%\helpers\7z.exe
SET CURL=%CWD%\helpers\curl.exe
:: Encrypted archives
SET TOOLARCH=%CWD%\enc-toolset.7z
SET FILEARCH=%CWD%\enc-files.7z
:: Password
SET PASS=aptsimulator
:: Target directories
SET APTDIR=C:\TMP
SET WWWROOT=C:\inetpub\wwwroot
:: Sleep Interval
SET SINTERVAL=OFF
SET SECONDMAX=300

CLS
ECHO ===============================WARNING====================================
ECHO.
ECHO This program is meant to simulate an APT (Advanced Persistent Threat)
ECHO which has traces of typical APT attacks. PLEASE FOLLOW THE BELOW RULES:
ECHO.
ECHO 1.RUN AS ADMIN
ECHO.
ECHO 2.ONLY RUN ON TEST SYSTEM
ECHO.
ECHO 3.ENSURE YOU HAVE A BACKUP
ECHO.
ECHO 4.DO NOT DEACTIVATE ANTIVIRUS
ECHO.
ECHO 5.DO NOT UPLOAD TO VIRUSTOTAL OR OTHER SERVICES
ECHO.
ECHO Ensure you have followed the above rules before running this test.
ECHO This test is designed to ensure your NIDS, HIDS, Security Policies
ECHO and other security procedures are in place to detect APT's.
ECHO.
ECHO ===============================WARNING====================================
ECHO.
setlocal

if [%1]==[-b] (
SET list="collection" "command-and-control" "credential-access" "defense-evasion" "discovery" "execution" "exfiltration" "lateral-movement" "persistence" "privilege-escalation"
goto :batchmode
)

:PROMPT
SET /P AREYOUSURE=Are you sure to proceed (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
GOTO MENU

:SETTINGS
CLS
ECHO ===========================================================================
ECHO Settings
ECHO.
ECHO   [Sleep Interval] = "%SINTERVAL%"
ECHO   [Maximum Seconds to Wait] = %SECONDMAX%
ECHO.
IF %SINTERVAL%==OFF ECHO   [A] Activate a random sleep interval between the test cases
IF %SINTERVAL%==ON ECHO   [D] Deactivate a random sleep interval between the test cases
ECHO   [S] Set the maximum seconds to wait between test cases (default=300)
ECHO.
ECHO   [E] Exit to Menu
ECHO.
SET /P M=Your selection (then press ENTER):
IF %M%==a SET SINTERVAL=ON
IF %M%==A SET SINTERVAL=ON
IF %M%==d SET SINTERVAL=OFF
IF %M%==D SET SINTERVAL=OFF
IF %M%==e GOTO MENU
IF %M%==E GOTO MENU
IF %M%==s GOTO SETMAXSECONDS
IF %M%==S GOTO SETMAXSECONDS
GOTO SETTINGS

:SETMAXSECONDS
SET /P M=Set the maximum seconds to wait:
SET SECONDMAX=%M%
GOTO SETTINGS

:AVEXCLUDER
"%ZIP%" e -p%PASS% %TOOLARCH% -aoa -o"%TEMP%" toolset\avexcluder.bat > NUL
call "%TEMP%\avexcluder.bat"
GOTO MENU

:MENU
CLS
color 07
ECHO ====================================================================
ECHO "  _____        __     _                                           "
ECHO " / ____|      / _|   | |                                          "
ECHO "| (___   __ _| |_ ___| | _____  ___ _ __                          "
ECHO " \___ \ / _` |  _/ _ \ |/ / _ \/ _ \ '_ \                         "
ECHO " ____) | (_| | ||  __/   <  __/  __/ |_) |                        "
ECHO "|_____/ \__,_|_| \___|_|\_\___|\___| .__/             _ _         "
ECHO " / ____|    | |                    | |               (_) |        "
ECHO "| |    _   _| |__   ___ _ __ ___  _|_| ___ _   _ _ __ _| |_ _   _ "
ECHO "| |   | | | | '_ \ / _ \ '__/ __|/ _ \/ __| | | | '__| | __| | | |"
ECHO "| |___| |_| | |_) |  __/ |  \__ \  __/ (__| |_| | |  | | |_| |_| |"
ECHO " \_____\__, |_.__/ \___|_|  |___/\___|\___|\__,_|_|  |_|\__|\__, |"
ECHO "        __/ |                                                __/ |"
ECHO "       |___/                                                |___/ "
ECHO ====================================================================
ECHO "APT Simulation Tool, Jacob Archuleta, v0.0.6"

ECHO.
ECHO Select the technique that you want to run:
ECHO.
ECHO   [0] Initial Access
ECHO   [1] Execution
ECHO   [2] Persistence
ECHO   [3] Privilege Escalation
ECHO   [4] Defense Evasion
ECHO   [5] Credential Access
ECHO   [6] Discovery
ECHO   [7] Lateral Movement
ECHO   [8] Collection
ECHO   [9] Command & Control
ECHO   [10] Exfiltration
ECHO   [E] Exit
ECHO.

SET /P M=Your selection (then press ENTER):
IF %M%==0 SET list="initial-access"
IF %M%==10 SET list="exfiltration"
IF %M%==8 SET list="collection"
IF %M%==9 SET list="command-and-control"
IF %M%==5 SET list="credential-access"
IF %M%==4 SET list="defense-evasion"
IF %M%==6 SET list="discovery"
IF %M%==1 SET list="execution"
IF %M%==7 SET list="lateral-movement"
IF %M%==2 SET list="persistence"
IF %M%==3 SET list="privilege-escalation"
IF %M%==e GOTO END
IF %M%==E GOTO END

:batchmode
:: Running all test sets
for %%i in (%list%) do (
    ECHO.
    ECHO ###########################################################################
    ECHO RUNNING SET: %%i
    ECHO.
    for /f "delims=" %%x in ('dir /b /a-d .\test-sets\%%i\*.bat') do (
        PAUSE
        :: Random wait time
        IF %SINTERVAL%==ON (
            CALL:RAND %SECONDMAX%
            ECHO Waiting !RANDNUM! seconds ...
            ping 127.0.0.1 -n !RANDNUM! > nul
        )
        call ".\test-sets\%%i\%%x"
    )
)
ECHO ===========================================================================
ECHO Finished!
PAUSE
GOTO MENU

if NOT [%1]==[-b] (
PAUSE
GOTO MENU

:RAND
SET /A RANDNUM=%RANDOM% %%(%1) +1
GOTO:EOF
)

:END
ECHO.
color 07
endlocal
