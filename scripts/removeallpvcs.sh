#!/bin/bash
oc get pvc | sed '1d' | awk '{print $1}' | xargs -n1 oc delete pvc
