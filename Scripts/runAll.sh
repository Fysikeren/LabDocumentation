#!/bin/bash

# Print the current date and time, at script start:
date +"runAll.sh was started on: %Y-%m-%d %H:%M:%S"

# Copy my logs from the Windows machine to this Pi:
printf "\nCopying logs from the Windows machine.\n"
# rsync -avuh /mnt/magnetlogs/MMTest/* /home/pi/Data/Logfiles/
rsync -avuh /mnt/susceptometry/* /home/pi/Data/Logfiles/

# Copy newest magnet temperature log to temporary file and plot it:
printf "\nPlotting magnet temperatures.\n"
cp -p "`ls -dtr1 /home/pi/Data/Logfiles/*Magnet.logtext | tail -1`" /home/pi/Data/magnetTemperatures.txt
/home/pi/Data/plotMagnetTemperatures.plt

# Copy newest DR general log to temporary file and plot it:
printf "\nPlotting DR pressure log.\n"
cp -p "`ls -dtr1 /home/pi/Data/Logfiles/*DR.log | tail -1`" /home/pi/Data/DRlog.txt
/home/pi/Data/plotDRlog.plt

# Copy newest DR temperature log to temporary file and plot it:
printf "\nPlotting DR temperatures.\n"
cp -p "`ls -dtr1 /home/pi/Data/Logfiles/*.dat | tail -1`" /home/pi/Data/DRtemps.txt
/home/pi/Data/plotDRtemps.plt

# Upload plots to website:
printf "\nUploading plots to the website.\n"
rsync -vh /home/pi/Data/Plots/*.png myon:public_html/Figures/

# Print the current date and time, at script end:
printf "\n"
date +"runAll.sh finished on: %Y-%m-%d %H:%M:%S"
