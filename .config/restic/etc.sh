#!/bin/bash
iiip=99.168.110.242
ressss=cur
if curl ipinfo.io/ip | grep -q $iiip; then
	echo "yes"
	restic backup /etc --password-file /home/wazard/.config/restic/pass.txt -r sftp://root@10.0.1.23:22//backup/laptop/etc
	echo "done"
fi
exit
