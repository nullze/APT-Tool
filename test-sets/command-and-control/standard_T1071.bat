ECHO Running fs to generate a list of current C2 destinations and performs DNS requests to each
powershell helpers/fs.exe run c2-dns

ECHO Running fs to generate a list of current C2 destinations and performs DNS requests to each
powershell helpers/fs.exe run c2-ip

ECHO Simulates Domain Generation Algorithms using random labels and top-level domains.
powershell helpers/fs.exe run dga

ECHO Generates DNS tunneling requests to *.sandbox.alphasoc.xyz
powershell helpers/fs.exe run tunnel
