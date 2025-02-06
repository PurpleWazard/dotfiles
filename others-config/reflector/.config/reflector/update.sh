#!/bin/bash
reflector --save /etc/pacman.d/mirrorlist --country US --sort rate --age 24 --protocol https
