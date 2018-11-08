#!/bin/bash
# This mounts the shared folder so that it is accessible to the data processing on this machine
# sudo mount -t cifs //192.168.8.10/MagnetLogs /mnt/magnetlogs -o user=username,pass=password,dom=domain,vers=1.0
# sudo mount -t cifs //192.168.8.10/Susceptometry /mnt/susceptometry -o user=username,pass=password,dom=domain,vers=1.0
sudo mount -t cifs //172.20.3.166/Susceptometry /mnt/susceptometry -o user=username,pass=password,dom=domain,vers=1.0