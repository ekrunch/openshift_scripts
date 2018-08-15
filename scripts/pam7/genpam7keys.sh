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

if [ $# -lt 2 ]; then
        echo "Usage : $0 <namespace name> <keystore password> <generate env file for oc new-app>"
        echo ""
	echo "Namespace : The Openshift project to use for secret generation"
	echo "Keystore Password : The password to embed into the keystore"
	echo "Generate ENV : If this parameter is set to \"yes\" then the script will generate an ENV file that can be passed to \"oc new-app\""
	echo ""
        echo "Example : \"$0 rhpam7demo redhat123 yes\" will create the keystore files and generate secrets in the rhpam7demo namespace, with a password of redhat123."
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

	GENENVFILE=`echo $3 | tr '[:upper:]' '[:lower:]'`

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

	echo ""
	echo "Business Central Server Keystore Secret Name : ${BCSECRETNAME}"
	echo "Business Central Server Keystore Filename : ${BCSTOREFN}"
	echo "Business Central Server Certificate Name : ${BCSECRETNAME}"
	echo "Business Central Server Keystore Password : ${KPASS}"
	echo ""
	echo "KIE Server Keystore Secret Name : ${KIESECRETNAME}"
	echo "KIE Server Keystore Filename : ${KIESTOREFN}"
	echo "KIE Server Certificate Name : ${KIESECRETNAME}"
	echo "KIE Server Keystore Password : ${KPASS}"

	if [ "${GENENVFILE}" = "yes" ]; then
		ENVFILE="rhpamauth.env"
		echo "Generating environment file : ${ENVFILE}"
		echo "APPLICATION_NAME=\"rhpam7authdemo\"" > ${ENVFILE}
		echo "KIE_ADMIN_USER=\"bpmsadmin\"" >> ${ENVFILE}
		echo "KIE_ADMIN_PWD=\"${KPASS}\"" >> ${ENVFILE}
		echo "KIE_SERVER_CONTROLLER_USER=\"controllerUser\"" >> ${ENVFILE}
		echo "KIE_SERVER_CONTROLLER_PWD=\"${KPASS}\"" >> ${ENVFILE}
		echo "KIE_SERVER_USER=\"executionUser\"" >> ${ENVFILE}
		echo "KIE_SERVER_PWD=\"${KPASS}\"" >> ${ENVFILE}
		echo "ADMIN_USERNAME=\"eapadmin\"" >> ${ENVFILE}
		echo "ADMIN_PASSWORD=\"${KPASS}\"" >> ${ENVFILE}
		echo "BUSINESS_CENTRAL_HTTPS_SECRET=\"businesscentral-app-secret\"" >> ${ENVFILE}
		echo "BUSINESS_CENTRAL_HTTPS_KEYSTORE=\"businesscentral.keystore\"" >> ${ENVFILE}
		echo "BUSINESS_CENTRAL_HTTPS_NAME=\"businesscentral-app-secret\"" >> ${ENVFILE}
		echo "BUSINESS_CENTRAL_HTTPS_PASSWORD=\"${KPASS}\"" >> ${ENVFILE}
		echo "KIE_SERVER_HTTPS_SECRET=\"kieserver-app-secret\"" >> ${ENVFILE}
		echo "KIE_SERVER_HTTPS_KEYSTORE=\"kieserver.keystore\"" >> ${ENVFILE}
		echo "KIE_SERVER_HTTPS_NAME=\"kieserver-app-secret\"" >> ${ENVFILE}
		echo "KIE_SERVER_HTTPS_PASSWORD=\"${KPASS}\"" >> ${ENVFILE}
	fi
fi
