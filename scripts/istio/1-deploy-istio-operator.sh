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

# Just in case the project creation fails, this should throw an error and stop
# the script from executing.
oc project istio-operator

echo Creating istio app
oc new-app -f https://raw.githubusercontent.com/Maistra/openshift-ansible/maistra-0.8/istio/istio_product_operator_template.yaml --param=OPENSHIFT_ISTIO_MASTER_PUBLIC_URL=${OCP_PUBLIC_URL}

#echo Waiting 10 seconds for OCP to calm down
#sleep 10

echo To check status, use the following commands.

echo List pods that should have gotten deployed in the previous step, an istio-operator pod should be there and running. 
echo oc get pods -n istio-operator

echo Viewing log of the istio operator pod, there should be 5 lines in the log letting you know that the operator is watching the resources.
echo oc logs -n istio-operator $(oc -n istio-operator get pods -l name=istio-operator --output=jsonpath={.items..metadata.name})
