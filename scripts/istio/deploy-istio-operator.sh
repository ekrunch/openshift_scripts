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

OCP_PUBLIC_URL=https://ocpmaster.internal.unixwarhammer.com:8443

oc login -u system:admin

echo Creating istio-operator namespace
oc new-project istio-operator

# Just in case the project creation fails, this will throw an error and stop
# the script from executing.
oc project istio-operator

echo Creating istio app
oc new-app -f https://raw.githubusercontent.com/Maistra/openshift-ansible/maistra-0.1.0-ocp-3.1.0-istio-1.0.0/istio/istio_product_operator_template.yaml --param=OPENSHIFT_ISTIO_MASTER_PUBLIC_URL=${OCP_PUBLIC_URL}

echo Listing pods that should have gotten deployed in the previous step
oc get pods -n istio-operator
