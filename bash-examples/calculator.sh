#!/bin/bash
# Author: Pradeep Singh Makwana (pradeepsighmakwana@gmail.com)
add() {
    echo "$1+$2"|bc
}
subtract(){
    first=$1
    second=$2
    echo $((first-second))
}
multiply(){
    first=$1
    second=$2
    echo $((first*second))
}

case $1 in 
  "add") add $2 $3
  ;;
  "subtract") subtract $2 $3
  ;;
  "multiply") multiply $2 $3
  ;;
  *) echo "Cannot process command."
esac