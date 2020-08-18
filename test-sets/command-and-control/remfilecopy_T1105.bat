@ECHO OFF

ECHO ===========================================================================
ECHO Remote File Copy - T1105
ECHO Files may be copied from one system to another to stage adversary tools or other files over the course of an operation.

certutil -urlcache -split -f https://www.safekeepsecurity.com/robots.txt robots.txt
