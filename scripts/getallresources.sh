#!/bin/bash

if [ $# -ne 1 ]; then
        echo "Usage : $0 <resource name>"
        echo ""
        echo "Example : \"$0 svc\" will retrieve all services in all projects."
else
        for OCPPROJECT in $(oc get projects | grep -v "^NAME" | awk '{print $1}')
        do
                echo "Project Name : ${OCPPROJECT}"
                oc get $1 -n ${OCPPROJECT}
        done
fi
