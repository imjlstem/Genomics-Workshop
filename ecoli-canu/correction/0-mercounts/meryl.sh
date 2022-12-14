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


#  Store must exist: correction/ecoli.gkpStore

#  Purge any previous intermediate result.  Possibly not needed, but safer.

rm -f ./ecoli.ms16.WORKING*

$bin/meryl \
  -B -C -L 2 -v -m 16 -threads 4 -memory 3276 \
  -s ../ecoli.gkpStore \
  -o ./ecoli.ms16.WORKING \
&& \
mv ./ecoli.ms16.WORKING.mcdat ./ecoli.ms16.mcdat \
&& \
mv ./ecoli.ms16.WORKING.mcidx ./ecoli.ms16.mcidx

#  File is important: ecoli.ms16.mcdat

#  File is important: ecoli.ms16.mcidx


#  Dump a histogram

$bin/meryl \
  -Dh -s ./ecoli.ms16 \
>  ./ecoli.ms16.histogram.WORKING \
2> ./ecoli.ms16.histogram.info \
&& \
mv -f ./ecoli.ms16.histogram.WORKING ./ecoli.ms16.histogram

#  File is important: ecoli.ms16.histogram

#  File is important: ecoli.ms16.histogram.info


#  Compute a nice kmer threshold.

$bin/estimate-mer-threshold \
  -h ./ecoli.ms16.histogram \
  -c 1 \
>  ./ecoli.ms16.estMerThresh.out.WORKING \
2> ./ecoli.ms16.estMerThresh.err \
&& \
mv ./ecoli.ms16.estMerThresh.out.WORKING ./ecoli.ms16.estMerThresh.out

#  File is important: ecoli.ms16.estMerThresh.out

#  File is important: ecoli.ms16.estMerThresh.err


exit 0
