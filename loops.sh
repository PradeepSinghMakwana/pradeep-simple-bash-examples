#!/bin/bash
# Author: Pradeep Singh Makwana (pradeepsinghmakwana@gmail.com)
echo "FOR LOOP"
echo "================================"
echo "each value specified"
for i in 2 3 4 5 6; do
  echo "$i";
done
echo "c like "
for ((i=2;i<=6;i++)); do
  echo "$i";
done
echo "using ... inside {}"
for i in {0..20..5}; do
  echo "$i";
done
echo "using seq"
for i in $(seq 1 2 6); do
  echo "$i";
done;
echo "print filename with loop"
for i in ./* ; do
  echo "$i";
done;
echo ""
echo "========================="
echo "WHILE LOOP"
echo "========================="
echo "using test"
i=2
while [ $i -le 6 ]; do
  echo "$i"
  i=$((i+1))
done
echo "print each line in file"
while IFS= read -r line; do
  echo "$line"
done < "/etc/passwd"
echo "skip some loops with continue and break"
i=1
while [ $i -le 6 ]; do
  i=$((i+1))
  if [ $i -eq 2 ]; then
    continue
  fi
  if [ $i -gt 4 ]; then
    break
  fi
  echo "$i"
done
echo ""
echo "========================="
echo "UNTIL LOOP"
echo "========================="
i=10
until [ 3 -gt $i ]; do
  echo "$i"
  i=$((i-1))
done