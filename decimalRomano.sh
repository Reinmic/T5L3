#!/bin/bash


decimal_to_roman() {

  roman=(I V X L C D M)
  decimal=(1 5 10 50 100 500 1000)


  num=$1
  i=6


  while [ $num -gt 0 ]
  do

    while [ ${decimal[i]} -gt $num ]
    do
      i=$((i-1))
    done


    result+="${roman[i]}"


    num=$((num-decimal[i]))
  done


  echo $result
}

echo "Dime un decimal (entre 1 y 1999): " decimal_to_roman
