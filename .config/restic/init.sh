#!/bin/bash
#restic init -r sftp://root@10.0.1.23://backup/laptop/etc --password-file /home/wazard/.config/restic/pass.txt
#restic init -r sftp://root@10.0.1.23://backup/laptop/home --password-file /home/wazard/.config/restic/pass.txt
restic init -r sftp://wazard@10.0.1.20://backup/laptop/etc --password-file /home/wazard/.config/restic/pass.txt
restic init -r sftp://wazard@10.0.1.20://backup/laptop/home --password-file /home/wazard/.config/restic/pass.txt
