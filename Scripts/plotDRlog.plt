#!/usr/bin/gnuplot
reset

set terminal pngcairo size 1920,1080 enhanced font 'Verdana,20'
# set terminal pngcairo size 1024,576 enhanced font 'Verdana,20'

# define axis
# remove border on top and right and set color to gray
set style line 11 lc rgb '#808080' lt 1
# set border 3 back ls 11
set tics nomirror
# define grid
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12

# set key top right
set key right outside
# set key below
set xtics rotate
set xlabel 'Date and time'
set ylabel 'Pressure [mbar?]'

# When plotting, I divide the x values by 3600 to get the times in hours.
# For the "recent" plots, I use only the last 360 values, which should correspond to the last hour (since LabView saves the values roughly every ten seconds).
# set format x '%.1f'
# set format y '%.1f'
set xdata time
set timefmt '%d/%m/%Y %H:%M:%S'
set format x "%d/%m %H:%M"

set output '/home/mathias/Data/Plots/DRlogPs.png'
# set yrange [0:1]
plot '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:3 t 'P2?',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:4 t 'P (condenser line)',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:5 t 'P3?',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:6 t 'P4',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:7 t 'P5'

set output '/home/mathias/Data/Plots/DRlogDumps.png'
# set yrange [0:1]
plot '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:8 t 'Dump 70 l',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:9 t 'Dump 20 l'

set output '/home/mathias/Data/Plots/DRlogPIVCStill.png'
# set autoscale y
plot '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:15 t 'P (IVC)',\
	 '< tail -n 60 /home/mathias/Data/DRlog.txt' u 1:16 t 'P (still)'

set terminal pngcairo size 1920,1080 enhanced font 'Verdana,20'
set output '/home/mathias/Data/Plots/DRlogAll.png'
plot '/home/mathias/Data/DRlog.txt' u 1:3 t 'P2?',\
	 '/home/mathias/Data/DRlog.txt' u 1:4 t 'P (condenser line)',\
	 '/home/mathias/Data/DRlog.txt' u 1:5 t 'P3?',\
	 '/home/mathias/Data/DRlog.txt' u 1:6 t 'P4',\
	 '/home/mathias/Data/DRlog.txt' u 1:7 t 'P5',\
	 '/home/mathias/Data/DRlog.txt' u 1:8 t 'Dump 70 l',\
	 '/home/mathias/Data/DRlog.txt' u 1:9 t 'Dump 20 l',\
	 '/home/mathias/Data/DRlog.txt' u 1:10 t '??',\
	 '/home/mathias/Data/DRlog.txt' u 1:11 t '??',\
	 '/home/mathias/Data/DRlog.txt' u 1:12 t '??',\
	 '/home/mathias/Data/DRlog.txt' u 1:13 t '??',\
	 '/home/mathias/Data/DRlog.txt' u 1:14 t '??',\
	 '/home/mathias/Data/DRlog.txt' u 1:15 t 'P (IVC)',\
	 '/home/mathias/Data/DRlog.txt' u 1:16 t 'P (still)'

# pause -1 "Hit any key to continue"
