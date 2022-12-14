set title 'read length'
set ylabel 'number of reads'
set xlabel 'read length, bin width = 250'

binwidth=250
set boxwidth binwidth
bin(x,width) = width*floor(x/width) + binwidth/2.0

set terminal png size 1024,1024
set output './ecoli.length-histograms.lg.png'
plot [1:50558] [0:] \
  './ecoli.original-expected-corrected-length.dat' using (bin($2,binwidth)):(1.0) smooth freq with boxes title 'original', \
  './ecoli.original-expected-corrected-length.dat' using (bin($3,binwidth)):(1.0) smooth freq with boxes title 'expected', \
  './ecoli.original-expected-corrected-length.dat' using (bin($4,binwidth)):(1.0) smooth freq with boxes title 'corrected'
set terminal png size 256,256
set output './ecoli.length-histograms.sm.png'
replot

set xlabel 'difference between expected and corrected read length, bin width = 250, min=-18331, max=26'

set terminal png size 1024,1024
set output './ecoli.length-difference-histograms.lg.png'
plot [-18331:26] [0:] \
  './ecoli.original-expected-corrected-length.dat' using (bin($7,binwidth)):(1.0) smooth freq with boxes title 'expected - corrected'
set terminal png size 256,256
set output './ecoli.length-difference-histograms.sm.png'
replot
