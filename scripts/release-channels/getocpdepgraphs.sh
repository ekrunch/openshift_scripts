#!/bin/bash

RELEASECHANNELS=('stable-4.1' 'stable-4.2' 'stable-4.3' 'stable-4.4' 'fast-4.2' 'fast-4.3' 'fast-4.4' 'candidate-4.3' 'candidate-4.4')
OUTPUTDIR=./graphs

mkdir -p ${OUTPUTDIR}

for item in "${RELEASECHANNELS[@]}"; 
do
  echo "Channel: ${item}"
  #curl -sH 'Accept:application/json' 'https://api.openshift.com/api/upgrades_info/v1/graph?channel=${item}&arch=amd64' | ./graph.sh | dot -Tsvg > ${OUTPUTDIR}/${item}.svg
  curl -sH 'Accept:application/json' "https://api.openshift.com/api/upgrades_info/v1/graph?channel=${item}&arch=amd64"  | ./graph.sh | dot -Tsvg > ${OUTPUTDIR}/${item}.svg
done

