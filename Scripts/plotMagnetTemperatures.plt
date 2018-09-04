#!/usr/bin/gnuplot
reset

# set terminal pngcairo size 1920,1080 enhanced font 'Verdana,20'
set terminal pngcairo size 1024,576 enhanced font 'Verdana,20'

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
set xtics rotate
set xlabel 'Time since reboot [hours]'
set ylabel 'Temperature [K]'

# When plotting, I divide the x values by 3600 to get the times in hours.
# For the "recent" plots, I use only the last 360 values, which should correspond to the last hour (since LabView saves the values roughly every ten seconds).
set format x '%.1f'
set format y '%.1f'
set output '/home/pi/Data/Plots/magnetTempRecentCoils.png'
set yrange [3.3:4.3]
plot '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil'

set format x '%.1f'
set format y '%.1f'
set output '/home/pi/Data/Plots/magnetTempRecent004K.png'
set yrange [3:5]
plot '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($2) t 'Upper HEx',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($3) t 'Lower HEx',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($4) t 'He pot',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($5) t '1st stage',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($6) t '2nd stage',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($9) t 'Switch',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($10) t 'He pot'

set format x '%.1f'
set format y '%.0f'
set output '/home/pi/Data/Plots/magnetTempRecent010K.png'
set yrange [0:10]
plot '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($2) t 'Upper HEx',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($3) t 'Lower HEx',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($4) t 'He pot',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($5) t '1st stage',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($6) t '2nd stage',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($9) t 'Switch',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($10) t 'He pot'

set format x '%.1f'
set format y '%.0f'
set output '/home/pi/Data/Plots/magnetTempRecent300K.png'
set yrange [0:300]
plot '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($2) t 'Upper HEx',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($3) t 'Lower HEx',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($4) t 'He pot',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($5) t '1st stage',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($6) t '2nd stage',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($9) t 'Switch',\
	 '< tail -n 360 /home/pi/Data/magnetTemperatures.txt' u ($1/3600):($10) t 'He pot'

set format x '%.0f'
set format y '%.0f'
set output '/home/pi/Data/Plots/magnetTempAll300K.png'
set yrange [0:300]
plot '/home/pi/Data/magnetTemperatures.txt' u ($1/3600):($2) t 'Upper HEx',\
	 '/home/pi/Data/magnetTemperatures.txt' u ($1/3600):($3) t 'Lower HEx',\
	 '/home/pi/Data/magnetTemperatures.txt' u ($1/3600):($4) t 'He pot',\
	 '/home/pi/Data/magnetTemperatures.txt' u ($1/3600):($5) t '1st stage',\
	 '/home/pi/Data/magnetTemperatures.txt' u ($1/3600):($6) t '2nd stage',\
	 '/home/pi/Data/magnetTemperatures.txt' u ($1/3600):($7) t 'Inner coil',\
	 '/home/pi/Data/magnetTemperatures.txt' u ($1/3600):($8) t 'Outer coil',\
	 '/home/pi/Data/magnetTemperatures.txt' u ($1/3600):($9) t 'Switch',\
	 '/home/pi/Data/magnetTemperatures.txt' u ($1/3600):($10) t 'He pot'

# pause -1 "Hit any key to continue"
