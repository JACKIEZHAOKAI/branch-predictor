#!/bin/bash
for i in {1..15}
do
   bunzip2 -kc ../traces/$1 | ./predictor --tournament:$i:$i:$i
done
