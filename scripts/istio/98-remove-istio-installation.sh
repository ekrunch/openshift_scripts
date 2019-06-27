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

echo "Remvoing Istio Installation (only works if the installation is named basic-install like the example provided)"
oc delete ServiceMeshControlPlane/basic-install -n istio-system

echo Please wait until the installer removes everything in the istio-system namespace and then execute 99-remove-istio-operator.sh to remove the operator
