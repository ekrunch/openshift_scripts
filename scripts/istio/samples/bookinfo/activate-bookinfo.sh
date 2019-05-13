#!/bin/bash
oc project bookinfo
oc scale  --replicas=1 deployment $(oc get deploy | sed "1d" | awk '{print $1}')
