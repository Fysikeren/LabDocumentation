#!/bin/bash

# Print the current date and time, at script start:
date +"runAll.sh was started on: %Y-%m-%d %H:%M:%S"

# Copy my logs from the Windows machine to this Pi:
printf "\nCopying logs from the Windows machine.\n"
# rsync -avuh /mnt/magnetlogs/MMTest/* /home/mathias/Data/Logfiles/
rsync -avuh /mnt/susceptometry/* /home/mathias/Data/Logfiles/

# Copy newest magnet temperature log to temporary file and plot it:
printf "\nPlotting magnet temperatures.\n"
cp -p "`ls -dtr1 /home/mathias/Data/Logfiles/*Magnet.logtext | tail -1`" /home/mathias/Data/magnetTemperatures.txt
/home/mathias/Data/plotMagnetTemperatures.plt

# Copy newest DR general log to temporary file and plot it:
printf "\nPlotting DR pressures.\n"
cp -p "`ls -dtr1 /home/mathias/Data/Logfiles/*DR.log | tail -1`" /home/mathias/Data/DRpress.txt
/home/mathias/Data/plotDRpress.plt

# Copy newest DR temperature log to temporary file and plot it:
printf "\nPlotting DR temperatures.\n"
cp -p "`ls -dtr1 /home/mathias/Data/Logfiles/*.dat | tail -1`" /home/mathias/Data/DRtemps.txt
/home/mathias/Data/plotDRtemps.plt

# Upload plots to website:
printf "\nUploading plots to the website.\n"
rsync -vh /home/mathias/Data/Plots/*.png myon:public_html/Figures/

# Print the current date and time, at script end:
printf "\n"
date +"runAll.sh finished on: %Y-%m-%d %H:%M:%S"
