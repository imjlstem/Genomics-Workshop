#!/bin/sh

syst=`uname -s`
arch=`uname -m`
name=`uname -n`

if [ "$arch" = "x86_64" ] ; then
  arch="amd64"
fi
if [ "$arch" = "Power Macintosh" ] ; then
  arch="ppc"
fi

bin="/opt/bioinf/canu-git/canu-1.6/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/opt/bioinf/canu-git/canu-1.6"
fi


#  Store must exist: trimming/ecoli.gkpStore

#  Purge any previous intermediate result.  Possibly not needed, but safer.

rm -f ./ecoli.ms22.WORKING*

$bin/meryl \
  -B -C -L 2 -v -m 22 -threads 4 -memory 3276 \
  -s ../ecoli.gkpStore \
  -o ./ecoli.ms22.WORKING \
&& \
mv ./ecoli.ms22.WORKING.mcdat ./ecoli.ms22.mcdat \
&& \
mv ./ecoli.ms22.WORKING.mcidx ./ecoli.ms22.mcidx

#  File is important: ecoli.ms22.mcdat

#  File is important: ecoli.ms22.mcidx


#  Dump a histogram

$bin/meryl \
  -Dh -s ./ecoli.ms22 \
>  ./ecoli.ms22.histogram.WORKING \
2> ./ecoli.ms22.histogram.info \
&& \
mv -f ./ecoli.ms22.histogram.WORKING ./ecoli.ms22.histogram

#  File is important: ecoli.ms22.histogram

#  File is important: ecoli.ms22.histogram.info


#  Compute a nice kmer threshold.

$bin/estimate-mer-threshold \
  -h ./ecoli.ms22.histogram \
  -c 0 \
>  ./ecoli.ms22.estMerThresh.out.WORKING \
2> ./ecoli.ms22.estMerThresh.err \
&& \
mv ./ecoli.ms22.estMerThresh.out.WORKING ./ecoli.ms22.estMerThresh.out

#  File is important: ecoli.ms22.estMerThresh.out

#  File is important: ecoli.ms22.estMerThresh.err


exit 0
