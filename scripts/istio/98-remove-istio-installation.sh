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

echo Remvoing Istio Installation
oc delete -n istio-operator Installation istio-installation

echo Please wait until the ansible installer removes the istio-system workspace and then execute 99-remove-istio-operator.sh to remove the operator
