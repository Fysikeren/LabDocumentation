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
set xlabel 'Time'

# When plotting, I divide the x values by 3600 to get the times in hours.
# For the "recent" plots, I use only the last 360 values, which should correspond to the last hour (since LabView saves the values roughly every ten seconds).
# set format x '%.1f'
set xdata time
set timefmt '%Y-%m-%d %H:%M:%S'
set format x "%d/%m %H:%M"

set output '/home/mathias/Data/Plots/DRtempsMC.png'
set yrange [0:500]
# set autoscale y
# set format y '%.1f'
set ylabel 'Temperature [mK]'
plot '< tail -n 360 /home/mathias/Data/DRtemps.txt' u 1:13 t 'MC 1',\
	 '< tail -n 360 /home/mathias/Data/DRtemps.txt' u 1:14 t 'MC 2',\

set output '/home/mathias/Data/Plots/DRtempsStill.png'
set yrange [0:2000]
# set autoscale y
# set format y '%.1f'
set ylabel 'Temperature [mK]'
plot '< tail -n 360 /home/mathias/Data/DRtemps.txt' u 1:12 t 'Still',\

set output '/home/mathias/Data/Plots/DRtempsSorb.png'
set yrange [0:5000]
# set autoscale y
# set format y '%.1f'
set ylabel 'Temperature [mK]'
plot '< tail -n 360 /home/mathias/Data/DRtemps.txt' u 1:11 t 'Sorb',\

set output '/home/mathias/Data/Plots/DRtempsAll.png'
set yrange [0:1000]
# set format y '%.1f'
set ylabel 'Temperature [mK]'
plot '/home/mathias/Data/DRtemps.txt' u 1:11 t 'Sorb',\
	 '/home/mathias/Data/DRtemps.txt' u 1:12 t 'Still',\
	 '/home/mathias/Data/DRtemps.txt' u 1:13 t 'MC 1',\
	 '/home/mathias/Data/DRtemps.txt' u 1:14 t 'MC 2',\

set output '/home/mathias/Data/Plots/DRtempsAllOhm.png'
set autoscale y
# set format y '%.0f'
set ylabel 'Resistance [Ω]'
plot '/home/mathias/Data/DRtemps.txt' u 1:3 t 'Sorb',\
	 '/home/mathias/Data/DRtemps.txt' u 1:4 t 'Still',\
	 '/home/mathias/Data/DRtemps.txt' u 1:5 t 'MC 1',\
	 '/home/mathias/Data/DRtemps.txt' u 1:6 t 'MC 2',\

# pause -1 "Hit any key to continue"
