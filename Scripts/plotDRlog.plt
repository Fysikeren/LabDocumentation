#!/usr/bin/gnuplot
reset

# set terminal pngcairo size 1920,1080 enhanced font 'Verdana,20'
set terminal pngcairo size 1024,576 enhanced font 'Verdana,12'

# Define axis:
set style line 11 lc rgb '#808080' lt 1
set tics nomirror

# Define grid:
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12

set key right outside

set xdata time
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%d/%m %H:%M"
set xtics rotate
set xlabel 'Date and time'

set ylabel 'Pressure'
set autoscale y
set format y '%1.0s %cbar'

# When plotting, I divide the x values by 3600 to get the times in hours.
# For the "recent" plots, I use only the last 360 values, which should correspond to the last hour (since LabView saves the values roughly every ten seconds).

set output '/home/mathias/Data/Plots/DRlogPs.png'
plot '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:3 t 'P2',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:4 t 'P (condenser line)',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:5 t 'P3',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:6 t 'P4',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:7 t 'P5'

set output '/home/mathias/Data/Plots/DRlogDumps.png'
plot '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:8 t 'Dump 70 l',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:9 t 'Dump 20 l'

set output '/home/mathias/Data/Plots/DRlogPIVCStill.png'
plot '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:($15/1000) t 'P (IVC)',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:($16/1000) t 'P (still)'

set output '/home/mathias/Data/Plots/DRlogAll.png'
set yrange [0:1.1]
plot '/home/mathias/Data/DRlog.txt' u 1:3 t 'P2',\
	 '/home/mathias/Data/DRlog.txt' u 1:4 t 'P (condenser line)',\
	 '/home/mathias/Data/DRlog.txt' u 1:5 t 'P3',\
	 '/home/mathias/Data/DRlog.txt' u 1:6 t 'P4',\
	 '/home/mathias/Data/DRlog.txt' u 1:7 t 'P5',\
	 '/home/mathias/Data/DRlog.txt' u 1:8 t 'Dump 70 l',\
	 '/home/mathias/Data/DRlog.txt' u 1:9 t 'Dump 20 l',\
	 '/home/mathias/Data/DRlog.txt' u 1:($15/1000) t 'P (IVC)',\
	 '/home/mathias/Data/DRlog.txt' u 1:($16/1000) t 'P (still)'

# pause -1 "Hit any key to continue"
