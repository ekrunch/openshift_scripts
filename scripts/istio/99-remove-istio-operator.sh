#!/bin/bash

# Remove Istio

error_exit() {
        local parent_lineno="$1"
        local message="$2"
        local code="${3:-1}"
        if [[ -n "$message" ]] ; then
                echo "Error on or near line ${parent_lineno}: ${message}; exiting with status ${code}"
        else
                echo "Error on or near line ${parent_lineno}; exiting with status ${code}"
        fi
        exit "${code}"
}

trap 'error_exit ${LINENO}' ERR

oc login -u system:admin

echo Removing Istio Operator
oc delete -n istio-operator -f https://raw.githubusercontent.com/Maistra/istio-operator/maistra-0.11/deploy/servicemesh-operator.yaml

echo Waiting 10 seconds for the previous command to set in.
sleep 10

echo Removing namespaces
oc delete project istio-system
oc delete project istio-operator
