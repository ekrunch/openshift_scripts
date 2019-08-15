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

echo Deploy control plane
oc create -n istio-system -f istio-installation.yaml

echo Run this command to watch pods during installation
echo oc get pods -n istio-system -w
echo
echo To verify installation, run the following command
echo oc get servicemeshcontrolplane/basic-install -n istio-system --template='{{range .status.conditions}}{{printf "%s=%s, reason=%s, message=%s\n\n" .type .status .reason .message}}{{end}}'
echo
echo When installationg is finished, output should look like this
echo -------------------------------------------------------------
echo "Installed=True, reason=InstallSuccessful, message=%!s()"
echo 
echo "Reconciled=True, reason=InstallSuccessful, message=%!s()"
echo -------------------------------------------------------------
echo
echo The following command will give the status of the pods
echo oc get pods -n istio-system

