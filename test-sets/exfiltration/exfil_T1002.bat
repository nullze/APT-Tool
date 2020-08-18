@ECHO OFF
ECHO ===========================================================================
ECHO Data Compressed - T1002
ECHO An adversary may compress data (e.g., sensitive documents) that is collected prior to exfiltration in order to make it portable and minimize the amount of data sent over the network.

ECHO 111-11-1111 Jane Doe 555-555-5555 Ext. 555 PII INFORMATION: Username Password Login Credential Hostname asdfasdfasdfasdf.com PASSWORD asdfasdfasdfasdf LOGIN Bank Account #: 1234567890 > loot.txt

compact /c loot.txt
