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
        echo "Usage : $0 <namespace name> <keystore password>"
        echo ""
        echo "Example : \"$0 rhpam7demo redhat123\" will create the keystore files and generate secrets in the rhpam7demo namespace, with a password of redhat123."
	echo ""
	echo "Note : keytool and oc *must* be in the path for this script to execute properly. Please log in to oc before running this script"
	echo ""
	echo ""
else
	NAMESPACE="$1"
	KPASS="$2"

	KIESECRETNAME="kieserver-app-secret"
	KIESTOREFN="kieserver.keystore"

	BCSECRETNAME="businesscentral-app-secret"
	BCSTOREFN="businesscentral.keystore"
	DNAME="CN=demo.redhat.com, OU=Lab, O=RedHat, L=Raleigh, S=NC, C=US"

	trap 'error_exit ${LINENO}' ERR

	echo "Switching to ${NAMESPACE} namespace"
	oc project ${NAMESPACE}

	echo "Creating KIE Server keystore."
	keytool -genkey -alias ${KIESECRETNAME} -keyalg RSA -keysize 2048 -keystore ${KIESTOREFN} -dname "${DNAME}" -noprompt -keypass "${KPASS}" -storepass "${KPASS}"
	echo "Creating Business Central keystore."
	keytool -genkey -alias ${BCSECRETNAME} -keyalg RSA -keysize 2048 -keystore ${BCSTOREFN} -dname "${DNAME}" -noprompt -keypass "${KPASS}" -storepass "${KPASS}"

	echo "Creating KIE OCP Secret."
	oc create secret generic ${KIESECRETNAME} --from-file=${KIESTOREFN} 
	echo "Creating BusinessCentral OCP Secret."
	oc create secret generic ${BCSECRETNAME} --from-file=${BCSTOREFN} 

	echo "Removing keystore files."
	rm ${KIESTOREFN} ${BCSTOREFN}

fi
