@ECHO OFF

ECHO ===========================================================================
ECHO Registry Run Keys - T1060
ECHO Adding an entry to the "run keys" in the Registry or startup folder will cause the program referenced to be executed when a user logs in.

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "SafekeepCybersecurity APT Test" /t REG_SZ /F /D "helpers/sc.exe"
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "SafekeepCybersecurity APT Test" /f
