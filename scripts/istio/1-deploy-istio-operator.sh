#!/bin/bash

# Please modify the OCP_PUBLIC_URL before running!

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

OCP_PUBLIC_URL=https://ocpmaster.internal.unixwarhammer.com:8443

oc login -u system:admin

echo Creating istio-operator namespace
oc new-project istio-operator
oc new-project istio-system

echo Creating istio app
oc apply -n istio-operator -f https://raw.githubusercontent.com/Maistra/istio-operator/maistra-0.10/deploy/servicemesh-operator.yaml

echo To check status, use the following commands.

echo List pods that should have gotten deployed in the previous step, an istio-operator pod should be there and running. 
echo oc get pods -n istio-operator -l name=istio-operator

echo Once the pod has successfuly started, view the log of the istio operator pod. The last few lines of the log should show that the controller and worker have been started.
echo oc logs -n istio-operator $(oc -n istio-operator get pods -l name=istio-operator --output=jsonpath={.items..metadata.name})
