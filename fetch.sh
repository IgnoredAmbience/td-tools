#!/bin/bash
# Usage, either of:
#   - ./fetch.sh
#     Fetches today's TD logs, up to now.
#   - ./fetch.sh 20190101
#      Fetches TD logs for 2019-01-01
#
# Either the area51 or opentraintimes td archives will be used, with a preference for minimum
# number of files to download. (Area51 for historic data, OTT for today's).

if [[ $# -gt 0 ]]; then
  y=${1:0:4}
  m=${1:4:2}
  d=${1:6:2}
  exec wget "https://cdn.area51.onl/archive/rail/td/${y}/${m#0}/${d#0}.tbz2"
fi

base="https://networkrail.opendata.opentraintimes.com/mirror/td/"
wd=$(date "+%Y%m%d")
mkdir -p $wd
cd $wd
wget -r -A ".gz" -np -nd -N "${base}$(date +%Y/%m/%d/)"
gunzip -fk *.gz

for f in *.log; do
  d=td/${f:3:4}/${f:7:2}/${f:9:2}/${f:11:2}
  mkdir -p $d
  ln -rs $f $d/${f:13:2}.td
done

tarname=$wd-partial.tbz2
tar -cvjhf $tarname td
mv $tarname ..
