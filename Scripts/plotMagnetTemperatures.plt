#!/usr/bin/gnuplot
reset

# set terminal pngcairo size 1920,1080 enhanced font 'Verdana,20'
set terminal pngcairo size 1024,576 enhanced font 'Verdana,12'

# Define axis:
# remove border on top and right and set color to gray
set style line 11 lc rgb '#808080' lt 1
set tics nomirror

# Define grid:
set style line 12 lc rgb '#808080' lt 0 lw 1
set grid back ls 12

set key right outside

set xtics rotate
set xlabel 'Time since restart [hours]'
set format x '%.1f'

set ylabel 'Temperature'
set format y '%.1f K'

# When plotting, I divide the x values by 3600 to get the times in hours.
# For the "recent" plots, I use only the last 360 values, which should correspond to the last hour (since LabView saves the values roughly every ten seconds).

set output '/home/mathias/Data/Plots/magnetTempRecentCoils.png'
set yrange [3.2:6.2]
# set yrange [0:300]
plot '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil'

set output '/home/mathias/Data/Plots/magnetTempRecent004K.png'
set yrange [3.2:6.2]
plot '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($2) t 'Upper HEx',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($3) t 'Lower HEx',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($4) t 'He pot',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($5) t '1st stage',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($6) t '2nd stage',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($9) t 'Switch',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($10) t 'He pot'

set format y '%.0f K'

set output '/home/mathias/Data/Plots/magnetTempRecent015K.png'
set yrange [0:15]
plot '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($2) t 'Upper HEx',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($3) t 'Lower HEx',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($4) t 'He pot',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($5) t '1st stage',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($6) t '2nd stage',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($9) t 'Switch',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($10) t 'He pot'

set output '/home/mathias/Data/Plots/magnetTempRecent300K.png'
set yrange [0:300]
plot '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($2) t 'Upper HEx',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($3) t 'Lower HEx',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($4) t 'He pot',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($5) t '1st stage',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($6) t '2nd stage',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($9) t 'Switch',\
	 '< tail -n 360 /home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($10) t 'He pot'

set format x '%.0f'

set output '/home/mathias/Data/Plots/magnetTempAll300K.png'
set autoscale y
# set yrange [0:300]
plot '/home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($2) t 'Upper HEx',\
	 '/home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($3) t 'Lower HEx',\
	 '/home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($4) t 'He pot',\
	 '/home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($5) t '1st stage',\
	 '/home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($6) t '2nd stage',\
	 '/home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '/home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil',\
	 '/home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($9) t 'Switch',\
	 '/home/mathias/Data/magnetTemperatures.txt' u ($1/3600):($10) t 'He pot'

# pause -1 "Hit any key to continue"
