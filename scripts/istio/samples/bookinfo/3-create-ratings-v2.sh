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

oc project bookinfo

oc apply -f https://raw.githubusercontent.com/istio/istio/release-1.0/samples/bookinfo/platform/kube/bookinfo-db.yaml
oc apply -f https://raw.githubusercontent.com/istio/istio/release-1.0/samples/bookinfo/platform/kube/bookinfo-ratings-v2.yaml
oc apply -f https://raw.githubusercontent.com/istio/istio/release-1.0/samples/bookinfo/platform/kube/bookinfo-mysql.yaml
oc apply -f https://raw.githubusercontent.com/istio/istio/release-1.0/samples/bookinfo/platform/kube/bookinfo-ratings-v2-mysql.yaml

echo Waiting 10 seconds for the deployments to calm down so we can patch the sidecar injector annotation in
sleep 10

../../inject-sidecar.sh deployment/mongodb-v1
../../inject-sidecar.sh deployment/mysqldb-v1
../../inject-sidecar.sh deployment/ratings-v2
../../inject-sidecar.sh deployment/ratings-v2-mysql

