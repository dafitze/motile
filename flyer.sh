#!/bin/bash
# cd /Users/danielfitze/CODE/ristretti/motile/sketches/flyer

# TODO GM
# - schwarzweiss oder nicht
# - alle flyer in einem dokument zusammenfassen (kacheln)

nb_docs=4

counter=1
while [ $counter -le $nb_docs ]
do
  echo $counter
  julia flyer.jl
  processing-java --sketch=$PWD --run
  mv test.pdf output/$counter.pdf
  ((counter++))
done

echo All done

