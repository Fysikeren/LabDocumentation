# Network setup

The computer that reads out data from the magnet cryostat and the DR runs Windows XP.
But since everything runs smoothly in Labview on that machine, there is no reason to replace it, and the NBI IT department has OK'ed keeping it running on Windows XP.
I therefore continue to use that machine, and have connected it to the NBI internal network by an ethernet cable and it has been assigned the IP ```172.20.3.166```.

![The network setup on the Windows PC](Figures/NetworkSetup.png)

## Samba

The Windows PC shares a number of folders, and I can access them on the other NBI PCs by pointing my file browser to ```smb://172.20.3.166/```.
The folder I use for my logs is ```C:\Suceptometry```, and it is shared under the name ```Suceptometry```.
I mount that folder in a Linux filesystem using the command

```bash
sudo mount -t cifs //172.20.3.166/Suceptometry /mnt/suceptometry -o user=username,pass=password,dom=domain,vers=1.0
```

which I saved in the bash script ```mountShare.sh```.
The option ```vers=1.0``` is important since the standard is a newer version, but Windows XP uses the old 1.0.

I would like to automatically mount the shared folder using the fstab on the ```magnetlab``` PC, but I haven't implemented that yet.
