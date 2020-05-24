#
# clop_process.sh
#
# usage: clop_process linnumber filename dirname variablename
l=$(($1-1))
f=$2
d=$3
strname=$4
bname=`basename $f`
tmpname=${d}/.tmp_${bname}
head  -$l $f >  $tmpname
echo CLOPPARSER.parse\(${strname}\) >> $tmpname
crystal $tmpname
