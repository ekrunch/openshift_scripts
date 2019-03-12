#!/bin/bash

for n in {1..100};
do
  DELAY=`echo $((1 + RANDOM % 10))`
  echo Delaying for 0.${DELAY} seconds.
  sleep 0.${DELAY}
  echo "Test Response Code :" `./test-bookinfo-gateway.sh`
done
