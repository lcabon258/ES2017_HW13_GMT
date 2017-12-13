@ECHO OFF
set ps=PlateMotionTemp.ps
set save=PlateMotion1.ps &REM 設定存檔的檔名
set InputVector=Vector.txt &REM 設定讀入的向量檔
set StudentID=r05224123 &REM 設定自己的學號
set Model="NUVEL 1A" &REM 設定模型的名稱

REM ===== ===== =====
echo "Plot Vectors"
REM Velocity Legend
copy %ps% %save%
echo 140 2 40 0 0 0 0 Legend | gmt psvelo -R -J -O -K -Se0.5p/0.95/0p -W1p,black,solid -A+e+gblack -P >> %save%
echo 143.5 2 40 mm/yr | gmt pstext -R -J -O -K -F+f12p,Helvetica,black+jLM >> %save%

REM Model Name 
echo 140 1 Model \: %Model% | gmt pstext -R -J -O -K -F+f12p,Helvetica,black+jLM  << EOF >> %save%

REM Velocity 
gmt psvelo %InputVector% -R -J -Se0.5p/0.95/0p -W1p,black,solid -A+e+gblack -O -K -P -h1>> %save%
REM 

echo "Plot Author"
echo 140 6 Student ID : %StudentID% | gmt pstext -R -J -O -K -F+f12p,Helvetica,black+jLM >> %save%

gmt psxy -R -J -O -T -UBL/0/0/"%StudentID%@@ntu.edu.tw" >> %save%
gmt psconvert -Tj -E300 -A1c %save%