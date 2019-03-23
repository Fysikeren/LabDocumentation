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

# For the "recent" plots, I use only the last 60 values.

set output '/home/mathias/Data/Plots/DRpressPs.png'
plot '< tail -n 60 /home/mathias/Data/DRpress.txt' u 1:3 t 'P2',\
	 '< tail -n 60 /home/mathias/Data/DRpress.txt' u 1:($4*4) t 'P (condenser line)',\
	 '< tail -n 60 /home/mathias/Data/DRpress.txt' u 1:5 t 'P3',\
	 '< tail -n 60 /home/mathias/Data/DRpress.txt' u 1:6 t 'P4',\
	 '< tail -n 60 /home/mathias/Data/DRpress.txt' u 1:7 t 'P5'

set output '/home/mathias/Data/Plots/DRpressDumps.png'
plot '< tail -n 60 /home/mathias/Data/DRpress.txt' u 1:8 t 'Dump 70 l',\
	 '< tail -n 60 /home/mathias/Data/DRpress.txt' u 1:9 t 'Dump 20 l'

set output '/home/mathias/Data/Plots/DRpressIVCStill.png'
plot '< tail -n 60 /home/mathias/Data/DRpress.txt' u 1:($15/1000) t 'P (IVC)',\
	 '< tail -n 60 /home/mathias/Data/DRpress.txt' u 1:($16/1000) t 'P (still)'

set output '/home/mathias/Data/Plots/DRpressAll.png'
set logscale y 10
plot '/home/mathias/Data/DRpress.txt' u 1:3 t 'P2',\
	 '/home/mathias/Data/DRpress.txt' u 1:($4*4) t 'P (condenser line)',\
	 '/home/mathias/Data/DRpress.txt' u 1:5 t 'P3',\
	 '/home/mathias/Data/DRpress.txt' u 1:6 t 'P4',\
	 '/home/mathias/Data/DRpress.txt' u 1:7 t 'P5',\
	 '/home/mathias/Data/DRpress.txt' u 1:8 t 'Dump 70 l',\
	 '/home/mathias/Data/DRpress.txt' u 1:9 t 'Dump 20 l',\
	 '/home/mathias/Data/DRpress.txt' u 1:($15/1000) t 'P (IVC)',\
	 '/home/mathias/Data/DRpress.txt' u 1:($16/1000) t 'P (still)'

# pause -1 "Hit any key to continue"
