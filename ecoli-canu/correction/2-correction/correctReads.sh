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

#  Discover the job ID to run, from either a grid environment variable and a
#  command line offset, or directly from the command line.
#
if [ x$CANU_LOCAL_JOB_ID = x -o x$CANU_LOCAL_JOB_ID = xundefined -o x$CANU_LOCAL_JOB_ID = x0 ]; then
  baseid=$1
  offset=0
else
  baseid=$CANU_LOCAL_JOB_ID
  offset=$1
fi
if [ x$offset = x ]; then
  offset=0
fi
if [ x$baseid = x ]; then
  echo Error: I need CANU_LOCAL_JOB_ID set, or a job index on the command line.
  exit
fi
jobid=`expr $baseid + $offset`
if [ x$CANU_LOCAL_JOB_ID = x ]; then
  echo Running job $jobid based on command line options.
else
  echo Running job $jobid based on CANU_LOCAL_JOB_ID=$CANU_LOCAL_JOB_ID and offset=$offset.
fi

if [ $jobid -gt 1 ]; then
  echo Error: Only 1 partitions, you asked for $jobid.
  exit 1
fi

if [ $jobid -eq 1 ] ; then
  bgn=1
  end=854
fi

jobid=`printf %04d $jobid`

if [ -e "./correction_outputs/$jobid.fasta" ] ; then
  echo Job finished successfully.
  exit 0
fi

if [ ! -d "./correction_outputs" ] ; then
  mkdir -p "./correction_outputs"
fi

#  Store must exist: correction/ecoli.gkpStore

#  Store must exist: correction/ecoli.ovlStore

#  File must exist: ecoli.readsToCorrect

#  File must exist: ecoli.globalScores

gkpStore="../ecoli.gkpStore"


if [ "x$BASH" != "x" ] ; then
  set -o pipefail
fi

( \
$bin/generateCorrectionLayouts -b $bgn -e $end \
  -rl ./ecoli.readsToCorrect \
  -G $gkpStore \
  -O ../ecoli.ovlStore \
  -S ./ecoli.globalScores \
  -C 80 \
  -F \
&& \
  touch ./correction_outputs/$jobid.dump.success \
) \
| \
$bin/falcon_sense \
  --min_idt 0.5 \
  --min_len 1000\
  --max_read_len 130040 \
  --min_ovl_len 500\
  --min_cov 0 \
  --n_core 2 \
  > ./correction_outputs/$jobid.fasta.WORKING \
 2> ./correction_outputs/$jobid.err \
&& \
mv ./correction_outputs/$jobid.fasta.WORKING ./correction_outputs/$jobid.fasta \

if [ ! -e "./correction_outputs/$jobid.dump.success" ] ; then
  echo Read layout generation failed.
  mv ./correction_outputs/$jobid.fasta ./correction_outputs/$jobid.fasta.INCOMPLETE
fi

#  File is important: correction_outputs/$jobid.fasta

exit 0
