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

echo Patching configuration using master-config.patch, backup in master-config.yaml.prepatch
cp -p ${OCP_CONFIG_DIR}/master-config.yaml ${OCP_CONFIG_DIR}/master-config.yaml.prepatch
oc ex config patch ${OCP_CONFIG_DIR}/master-config.yaml.prepatch -p "$(cat master-config.patch)" > ${OCP_CONFIG_DIR}/master-config.yaml

echo Restarting API
master-restart api

echo Restarting Controllers
master-restart controllers


