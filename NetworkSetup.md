# Network setup

## Background

The computer that reads out data from the magnet cryostat and the DR runs Windows XP and is apparrently virus infected.
But since everything runs smoothly in Labview on that machine, I don't want to replace it right away (it has much higher priority to set up a computer for controlling the magnetic field and the susceptometer).
I have therefore bought a Raspberry Pi 3 B+, and plan to connect it to both the KU network and a LAN especially for the Pi and the PC, such that the Pi is the only machine connected to the internet.
This LAN might also be used for the (as yet nonexisting) controller PC, since it may be an advantage to defer updates, so you don't have to reboot in the middle of an experiment, and that is safer with an airgap to the internet.

## The LAN

There is no reliable WiFi connection available in the lab (Eduroam relies on a specific person's identity and is not well suited for this purpose), so I have decided to set up a wireless router (with nothing on the WAN side) and use that for the lab LAN.
The PC will be connected by cable.

I set up the router DHCP to give the Pi and PC specific IPs and follow this guide to setup on the Pi:
[Connect to offline network on second interface](https://unix.stackexchange.com/questions/177973/connect-to-offline-network-on-second-interface)

## Samba

The Windows PC shares the folders by SMB.

## NTP

To syncronize the clocks on the machines, I might set up the Pi as an NTP server:
[NTP client and server](http://raspberrypi.tomasgreno.cz/ntp-client-and-server.html)