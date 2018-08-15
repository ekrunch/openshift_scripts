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

if [ $# -ne 2 ]; then
        echo "Usage : $0 <namespace name> <password>"
        echo ""
        echo "Example : \"$0 rhpam7-demo redhat123.\" will create the project rhpam7-demo with a password of redhat123."
	echo ""
	echo "Note : keytool and oc *must* be in the path for this script to execute properly. Please log in to oc before running this script"
	echo ""
	echo ""
else
	NAMESPACE="$1"
	KPASS="$2"

	trap 'error_exit ${LINENO}' ERR

	oc new-project $1 --display-name="RH Process Automation Manager 7 Demo"
	oc project $1
	./genpam7keys.sh $1 $2 yes
	oc new-app --template=rhpam70-authoring --param-file=rhpamauth.env
	echo ""
	echo "Environment created with the following parameters. Note the usernames / passwords needed to log in."
	echo ""
	cat rhpamauth.env

fi
