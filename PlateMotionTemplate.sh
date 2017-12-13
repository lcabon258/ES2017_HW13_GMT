R=118/150/0/41.6
ps=PlateMotionTemp.ps
ri=PlateBoundaries/ridge.gmt
tra=PlateBoundaries/transform.gmt
tre=PlateBoundaries/trench.gmt
echo "Plot Basemap"
gmt pscoast -R${R} -JM15C  -BNEWS+t"Plate Motion of PS relative to EU" -Ba10f5g5  -Df -Glightgreen -Slightblue -K -P > ${ps}
# Plate boundary
gmt psxy ${tre} -R -J -O -K -W1p,red,solid >> ${ps}
gmt psxy ${tra} -R -J -O -K -W1p,darkgreen,solid >> ${ps}
gmt psxy ${ri} -R -J -O -K -W1p,blue,solid >> ${ps}
# Name of plates
gmt pstext -R -J -O -K -F+f12p,Helvetica-Bold,black  << EOF >> ${ps}
122 31 Eurasia Plate
135 17 Philippine Sea Plate
EOF
echo "Plot Legend Box"
# Legend box
gmt psxy -R -J -O -K -W1p,black,solid -Gwhite << EOF >> ${ps}
139 0
139 7
150 7
150 0
139 0
EOF

# trench
gmt psxy -R -J -O -K -W1p,red,solid << EOF >> ${ps}
140 5
142 5
EOF
gmt pstext -R -J -O -K -F+f12p,Helvetica,red+jLM  << EOF >> ${ps}
143.5 5 Trench
EOF
# transform
gmt psxy -R -J -O -K -W1p,darkgreen,solid << EOF >> ${ps}
140 4
142 4
EOF
gmt pstext -R -J -O -K -F+f12p,Helvetica,darkgreen+jLM  << EOF >> ${ps}
143.5 4 Transform
EOF
# ridge
gmt psxy -R -J -O -K -W1p,blue,solid << EOF >> ${ps}
140 3
142 3
EOF
gmt pstext -R -J -O -K -F+f12p,Helvetica,blue+jLM  << EOF >> ${ps}
143.5 3 Ridge
EOF
