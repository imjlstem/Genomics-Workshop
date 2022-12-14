set terminal canvas jsdir ""
set output "/home/taller-2048/GENOMICS_WORKSHOP/coli_k-12/test_quast/contigs_reports/nucmer_output/scaffolds.html"
set ytics ( \
 "0" 0, \
 "600000" 600000, \
 "1200000" 1200000, \
 "1800000" 1800000, \
 "2400000" 2400000, \
 "3000000" 3000000, \
 "3600000" 3600000, \
 "4200000" 4200000, \
 "" 4755000 \
)
set size 1,1
set grid
set key outside bottom right
set border 0
set tics scale 0
set xlabel "Reference" noenhanced
set ylabel "Assembly" noenhanced
set format "%.0f"
set xrange [1:*]
set yrange [1:4755000]
set linestyle 1  lt 1 lc rgb "red" lw 3 pt 7 ps 0.5
set linestyle 2  lt 3 lc rgb "blue" lw 3 pt 7 ps 0.5
set linestyle 3  lt 2 lc rgb "yellow" lw 3 pt 7 ps 0.5
plot \
 "/home/taller-2048/GENOMICS_WORKSHOP/coli_k-12/test_quast/contigs_reports/nucmer_output/scaffolds.fplot" title "FWD" w lp ls 1, \
 "/home/taller-2048/GENOMICS_WORKSHOP/coli_k-12/test_quast/contigs_reports/nucmer_output/scaffolds.rplot" title "REV" w lp ls 2
