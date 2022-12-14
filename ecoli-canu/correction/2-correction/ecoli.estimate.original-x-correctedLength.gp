set title 'original length (x) vs corrected length (y)'
set xlabel 'original read length'
set ylabel 'corrected read length (expected)'
set pointsize 0.25

set terminal png size 1024,1024
set output './ecoli.estimate.original-x-corrected.lg.png'
plot './ecoli.estimate.tn.log' using 2:4 title 'tn', \
     './ecoli.estimate.fn.log' using 2:4 title 'fn', \
     './ecoli.estimate.fp.log' using 2:4 title 'fp', \
     './ecoli.estimate.tp.log' using 2:4 title 'tp'
set terminal png size 256,256
set output './ecoli.estimate.original-x-corrected.sm.png'
replot
