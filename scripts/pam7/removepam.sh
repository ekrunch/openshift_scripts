#!/bin/bash

oc get templates | grep -i rhpam | awk '{print $1}' | xargs -n1 -t -I{} oc delete template/{}
oc get is | grep -i rhpam | awk '{print $1}' | xargs -n1 -t -I{} oc delete is/{}

