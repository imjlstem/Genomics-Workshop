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

if [ $jobid -eq 1 ] ; then
  blk="000001"
  slf=""
  cvt="-h 1 0 -q 1"
  qry="000001"
fi


if [ x$qry = x ]; then
  echo Error: Job index out of range.
  exit 1
fi

if [ -e ./results/$qry.ovb ]; then
  echo Job previously completed successfully.
  exit
fi

#  File must exist: queries.tar

if [ -e ./queries.tar -a ! -d ./queries ] ; then
  tar -xf ./queries.tar
fi

if [ ! -d ./results ]; then
  mkdir -p ./results
fi

if [ ! -d ./blocks ] ; then
  mkdir -p ./blocks
fi
#  File must exist: blocks/$blk.dat
for ii in `ls ./queries/$qry` ; do
  echo Fetch blocks/$ii
#  File must exist: blocks/$ii
done

#  File must exist: ecoli.ms16.frequentMers.ignore.gz

echo ""
echo Running block $blk in query $qry
echo ""

if [ ! -e ./results/$qry.mhap ] ; then
  java -d64 -server -Xmx5120m \
    -jar  $bin/mhap-2.1.2.jar  \
    --repeat-weight 0.9 --repeat-idf-scale 10 -k 16 \
    --num-hashes 768 \
    --num-min-matches 2 \
    --threshold 0.78 \
    --filter-threshold 0.000005 \
    --ordered-sketch-size 1536 \
    --ordered-kmer-size 12 \
    --min-olap-length 500 \
    --num-threads 16 \
    -s  ./blocks/$blk.dat $slf  \
    -q  queries/$qry  \
  > ./results/$qry.mhap.WORKING \
  && \
  mv -f ./results/$qry.mhap.WORKING ./results/$qry.mhap
fi

if [   -e ./results/$qry.mhap -a \
     ! -e ./results/$qry.ovb ] ; then
  $bin/mhapConvert \
    -G ../ecoli.gkpStore \
    $cvt \
    -o ./results/$qry.mhap.ovb.WORKING \
    ./results/$qry.mhap \
  && \
  mv ./results/$qry.mhap.ovb.WORKING ./results/$qry.mhap.ovb
fi

if [   -e ./results/$qry.mhap -a \
       -e ./results/$qry.mhap.ovb ] ; then
  rm -f ./results/$qry.mhap
fi

if [ -e ./results/$qry.mhap.ovb ] ; then
  mv -f ./results/$qry.mhap.ovb ./results/$qry.ovb
fi

#  File is important: results/$qry.ovb
#  File is important: results/$qry.counts

exit 0
