#!/bin/bash

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

OCP_CONFIG_DIR=/etc/origin/master
OCP_PUBLIC_URL=https://ocpmaster.internal.unixwarhammer.com:8443

oc login -u system:admin

echo Deploying control plane
oc project istio-operator
oc create -f istio-installation.yaml

echo Listing pods that should have gotten deployed in the previous step
oc get pods -n istio-system -w
