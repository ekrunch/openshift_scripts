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

oc new-project bookinfo
oc project bookinfo
oc adm policy add-scc-to-user anyuid -z default -n bookinfo
oc adm policy add-scc-to-user privileged -z default -n bookinfo
oc apply -n bookinfo -f https://raw.githubusercontent.com/Maistra/bookinfo/maistra-0.4.0/bookinfo.yaml
oc apply -n bookinfo -f https://raw.githubusercontent.com/Maistra/bookinfo/maistra-0.4.0/bookinfo-gateway.yaml

