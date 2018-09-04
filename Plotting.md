# Automated plotting of logged data

The Windows PC runs a group of LabView programs that control the dilution refrigerator and log the magnet temperatures as well as the DR pressures and temperatures.
On the machine is also a LabView program to visualize the data saved to the log files, but I wanted a way to follow the status of the equipment without being in the lab.

My solution is to use the Raspberry Pi (which can access both the PC and the internet, see [Network Setup](NetworkSetup.md)) to automatically copy the logged data off the PC, plot it, and upload it to my website on the NBI server.

## Mounting the shared folder from the Windows PC

This is described in [Network Setup](NetworkSetup.md).

## Plotting the data

I use [gnuplot](http://gnuplot.info) for plotting.

## Script for copying, plotting and uploading

I assembled all of this into at script by the name of ```runAll.sh```, which 

## Cronjob

In the crontab on the Pi, i have added the line
```
*/10 * * * * /home/pi/Data/runAll.sh > /home/pi/Data/cronLog.txt
```
which runs ```runAll.sh``` every ten minutes, and saves the output to ```cronLog.txt```, overwriting the file each time.
If the script was successful, ```cronLog.txt``` will contain a line saying when the script was last run followed by the output of the ```rsync``` commands.
```Gnuplot``` only gives output if it encounters an error.

The output of a successful run will look like this:
```
runAll.sh was started on: 2018-09-04 12:00:02

Copying logs from the Windows machine.
sending incremental file list
2018-08-31_DR.log
2018-08-31_Magnet.log
2018-08-31_Magnet.logtext
Temps_2018-08-31-14-33-44.dat

sent 7.46M bytes  received 92 bytes  1.66M bytes/sec
total size is 7.63M  speedup is 1.02

Plotting magnet temperatures.

Plotting DR pressure log.

Plotting DR temperatures.

Uploading plots to the website.
DRlogAll.png
DRlogDumps.png
DRlogPIVCStill.png
DRlogPs.png
DRtemps.png
DRtempsOhm.png
DRtempsOhmRecent.png
DRtempsRecent.png
magnetTempAll300K.png
magnetTempRecent004K.png
magnetTempRecent010K.png
magnetTempRecent300K.png
magnetTempRecentCoils.png

sent 458,647 bytes  received 5,483 bytes  928,260.00 bytes/sec
total size is 606,479  speedup is 1.31

runAll.sh finished on: 2018-09-04 12:00:46
```