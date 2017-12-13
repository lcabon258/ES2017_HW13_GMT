ps=PlateMotionTemp.ps
save=PlateMotion1.ps
StudentID=r05224123
Model="NUVEL 1A"
echo "Plot Vectors"
# Velocity Legend
cp ${ps} ${save}
gmt psvelo -R -J -O -K -Se0.5p/0.95/0p -W1p,black,solid -A+e+gblack -P  << EOF >> ${save}
140 2 40 0 0 0 0 Legend
EOF
gmt pstext -R -J -O -K -F+f12p,Helvetica,black+jLM  << EOF >> ${save}
143.5 2 40 mm/yr
EOF
# Model Name 
gmt pstext -R -J -O -K -F+f12p,Helvetica,black+jLM  << EOF >> ${save}
140 1 Model \: ${Model}
EOF

# Velocity -> Homework
gmt psvelo -R -J -Se0.5p/0.95/0p -W1p,black,solid -A+e+gblack -O -K -P -h1 << EOF >> ${save}
Lon(°E) Lat(°N) Evel(mm/yr) Nvel(mm/yr) Eerr Nerr corr Plate(Reference) Model Site
130.000000  20.000000  -53.55   34.54 0 0 0 PH(EU) NUVEL 1A Ex1
EOF
echo "Plot Author"
gmt pstext -R -J -O -K -F+f12p,Helvetica,black+jLM  << EOF >> ${save}
140 6 Student ID \: ${r05224123}
EOF

gmt psxy -R -J -O -T -UBL/0/0/"${StudentID}@@ntu.edu.tw" >> ${save}
gmt psconvert -Tj -E300 -A1c ${save}