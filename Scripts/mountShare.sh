#!/bin/bash
# This mounts the shared folder so that it is accessible to the data processing on this machine
# sudo mount -t cifs //192.168.8.10/MagnetLogs /mnt/magnetlogs -o user=admin,pass=Leiden,dom=WORKGROUP,vers=1.0
sudo mount -t cifs //192.168.8.10/Susceptometry /mnt/susceptometry -o user=admin,pass=Leiden,dom=WORKGROUP,vers=1.0
