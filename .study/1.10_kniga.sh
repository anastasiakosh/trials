#!/bin/sh

M=$1 #15
N=$2 #5
end=$((M+N))
while [ $M -lt $end ]; do
      echo $M
M=$((M+1))
done
