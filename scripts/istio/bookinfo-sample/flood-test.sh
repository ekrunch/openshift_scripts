#!/bin/bash

for n in {1..50};
do
#  DELAY=`echo $((1 + RANDOM % 10))`
#  echo Delaying for ${DELAY} seconds.
#  sleep ${DELAY}
  echo "Spawning test ${n}"
  echo "Test ${n} Response Code :" `./test-bookinfo-gateway.sh` &
#  ./test-bookinfo-gateway.sh &
done
