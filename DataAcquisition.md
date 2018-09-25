# Data acquisition

The magnet cryostat and the dilution refrigerator are connected to a PC running LabView (7.1?) on Windows XP.
In Labview, a number of scripts are available for controlling the dilution refrigerator and reading off values from the DR and magnet systems.

Later, I will make a system to control the DR, the magnet and a lock-in amplifier, to be able to make measurements controlled solely by the PC.

## Magnet temperatures

![The LabView program that reads the temperatures different places in the magnet assembly and writes them to a log file](Figures/ThermometerScanner.png)

## DR front panel and pressures

![The LabView program that emulates the front panel on the dilution fridge](Figures/LeidenPanel.png)

## DR temperatures

![The LabView program that reads the temperatures in the dilution fridge and writes them to a log file](Figures/TC.png)

## Viewing the logged data

![The LabView program that plots the different logs](Figures/DisplayAllLogs.png)