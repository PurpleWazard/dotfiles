#!/bin/bash
iiip=99.168.110.242
if curl ipinfo.io/ip | grep -q $iiip; then
	echo "yes"
	restic backup /home --exclude-file=/home/wazard/.config/restic/exclude.txt --password-file /home/wazard/.config/restic/pass.txt -r sftp://arch:22//backup/laptop/home/
	restic backup /home --exclude-file=/home/wazard/.config/restic/exclude.txt --password-file /home/wazard/.config/restic/pass.txt -r sftp://debian:22//backup/laptop/home/
	echo "done"
else
  echo "nope"
	# restic backup /home --exclude-file=/home/wazard/.config/restic/exclude.txt --password-file /home/wazard/.config/restic/pass.txt -r sftp://root@99.168.110.242:2020//backup/laptop/
fi
exit
