@ECHO OFF

ECHO ===========================================================================
ECHO System Network Configuration Discovery - T1016
ECHO Adversaries will likely look for details about the network configuration and settings of systems they access or through information discovery of remote systems.

ipconfig /all
netsh interface show
arp -a
nbtstat -n
net config
