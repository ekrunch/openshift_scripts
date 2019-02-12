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
oc process -n istio-operator -f https://raw.githubusercontent.com/Maistra/openshift-ansible/maistra-0.7/istio/istio_product_operator_template.yaml | oc delete -f -
