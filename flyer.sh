#!/bin/bash
# cd /Users/danielfitze/CODE/ristretti/motile/sketches/flyer

# TODO GM
# - schwarzweiss oder nicht
# - alle flyer in einem dokument zusammenfassen (kacheln)

nb_docs=50

counter=1
while [ $counter -le $nb_docs ]
do
  echo $counter
  julia test1.jl
  processing-java --sketch=$PWD --run
  mv test.pdf output/test1/$counter.pdf
  ((counter++))
done

counter=1
while [ $counter -le $nb_docs ]
do
  echo $counter
  julia test2.jl
  processing-java --sketch=$PWD --run
  mv test.pdf output/test2/$counter.pdf
  ((counter++))
done


echo All done

