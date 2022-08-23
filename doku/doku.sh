#!/bin/bash
# cd /Users/danielfitze/CODE/ristretti/motile/sketches/flyer


paths=( "/Users/danielfitze/ristretti/GIT/motile/data/motile/1_Admin" "/Users/danielfitze/ristretti/GIT/motile/data/motile/2_Recherche" "/Users/danielfitze/ristretti/GIT/motile/data/motile/3_Erscheinungsbild"
"/Users/danielfitze/ristretti/GIT/motile/data/motile/4_Präsentationen" )

nb_docs=100
nb_chapter=1

for path in ${paths[@]}; do # run bash script for each chapter
  rm ../output/Chapter$nb_chapter/* # remove old docs
  rm -rf $path/Text/.*
  rm -rf $path/Bild/.*
  rm -rf $path/Titel/.*
  counter=1
  while [ $counter -le $nb_docs ]
  do
    echo $counter
    julia doku.jl $path
    processing-java --sketch=$PWD --run
    mv test.pdf ../output/Chapter$nb_chapter/$counter.pdf
    # sace INFO.csv
    #mv ../data/INFO/julia_info.csv ../output/Chapter$nb_chapter/$counter.INFO.csv
    ((counter++))
  done
  ((nb_chapter++))
done # end run bash script for each chapter


echo All done

