#! /bin/sh
#
filename=$1

srcExt=$2
destExt=$3

srcDir=$4
destDir=$5


basePath=dir

while $filename in "$srcDir"/*."$srcExt"; do
  baseName=${basePath##*/}
  printf  "%s" "$baseName"
  ffmpeg -i "$filename" -codec copy "$destDir"/"$baseName"."$destExt"
done

printf "Conversion from %s to %s complete!" "$srcExt"  "$destExt"

