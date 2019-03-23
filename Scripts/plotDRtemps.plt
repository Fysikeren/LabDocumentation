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
set timefmt '%Y-%m-%d %H:%M:%S'
set format x "%d/%m %H:%M"
set xtics rotate
set xlabel 'Time'

set autoscale y
set format y '%1.2s %cK'
set ylabel 'Temperature'

# For the "recent" plots, I use only the last 360 values.

set output '/home/mathias/Data/Plots/DRtempsMC.png'
plot '< tail -n 360 /home/mathias/Data/DRtemps.txt' u 1:($13/1000) t 'MC 1',\
	 '< tail -n 360 /home/mathias/Data/DRtemps.txt' u 1:($14/1000) t 'MC 2',\

set output '/home/mathias/Data/Plots/DRtempsStill.png'
plot '< tail -n 360 /home/mathias/Data/DRtemps.txt' u 1:($12/1000) t 'Still',\

# set output '/home/mathias/Data/Plots/DRtempsSorb.png'
# plot '< tail -n 360 /home/mathias/Data/DRtemps.txt' u 1:($11/1000) t 'Sorb',\

set output '/home/mathias/Data/Plots/DRtempsAll.png'
plot '/home/mathias/Data/DRtemps.txt' u 1:($11/1000) t 'Sorb',\
	 '/home/mathias/Data/DRtemps.txt' u 1:($12/1000) t 'Still',\
	 '/home/mathias/Data/DRtemps.txt' u 1:($13/1000) t 'MC 1',\
	 '/home/mathias/Data/DRtemps.txt' u 1:($14/1000) t 'MC 2',\

set ylabel 'Resistance'
set format y '%1.0s %cΩ'

set output '/home/mathias/Data/Plots/DRtempsAllOhm.png'
plot '/home/mathias/Data/DRtemps.txt' u 1:3 t 'Sorb',\
	 '/home/mathias/Data/DRtemps.txt' u 1:4 t 'Still',\
	 '/home/mathias/Data/DRtemps.txt' u 1:5 t 'MC 1',\
	 '/home/mathias/Data/DRtemps.txt' u 1:6 t 'MC 2',\

# pause -1 "Hit any key to continue"
