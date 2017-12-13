@ECHO OFF
set ps=PlateMotionTemp.ps
set save=PlateMotion1.ps
set InputVector=Vector.txt
set StudentID=r05224123
set Model="NUVEL 1A"

REM ===== ===== =====
echo "Plot Vectors"
REM Velocity Legend
copy /A %ps% %save%
echo 140 2 40 0 0 0 0 Legend | gmt psvelo -R118/150/0/41.6 -JM15c -O -K -Se0.5p/0.95/0p -W1p,black,solid -A+e+gblack -P >> %save%
echo 143.5 2 40 mm/yr | gmt pstext -R -J -O -K -F+f12p,Helvetica,black+jLM >> %save%

REM Model Name 
echo 140 1 Model \: %Model% | gmt pstext -R -J -O -K -F+f12p,Helvetica,black+jLM  >> %save%

REM Velocity 
gmt psvelo %InputVector% -R -J -Se0.5p/0.95/0p -W1p,black,solid -A+e+gblack -O -K -P -h1 >> %save%
REM 

echo "Plot Author"
echo 140 6 Student ID : %StudentID% | gmt pstext -R -J -O -K -F+f12p,Helvetica,black+jLM >> %save%

gmt psxy -R -J -O -T -UBL/0/0/"%StudentID%@@ntu.edu.tw" >> %save%
gmt psconvert -Tj -E300 -A1c %save%
pause
