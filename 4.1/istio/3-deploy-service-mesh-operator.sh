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

echo Creating namespaces for istio operator and system
oc new-project istio-operator
oc new-project istio-system

echo Creating Red Hat Service Mesh operator
oc apply -n istio-operator -f https://raw.githubusercontent.com/Maistra/istio-operator/maistra-0.12/deploy/servicemesh-operator.yaml

echo To verify installation, please execute
echo oc get pods -n istio-operator
echo
echo Status should look something like the following
echo
echo NAME                              READY     STATUS    RESTARTS   AGE
echo istio-operator-5cd6bcf645-fvb57   1/1       Running   0          1h
