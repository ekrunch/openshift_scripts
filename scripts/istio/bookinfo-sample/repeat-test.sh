#!/bin/bash

for n in {1..10};
do
  DELAY=`echo $((1 + RANDOM % 10))`
  echo Delaying for ${DELAY} seconds.
  sleep ${DELAY}
  echo "Test Response Code :" `./test-bookinfo-gateway.sh`
done
