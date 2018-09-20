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

oc login -u system:admin

echo Installing Fuse 7.1 components

trap 'error_exit ${LINENO}' ERR

BASEURL=https://raw.githubusercontent.com/jboss-fuse/application-templates/application-templates-2.1.fuse-710017-redhat-00006
oc create -n openshift -f ${BASEURL}/fis-image-streams.json

for template in eap-camel-amq-template.json \
 eap-camel-cdi-template.json \
 eap-camel-cxf-jaxrs-template.json \
 eap-camel-cxf-jaxws-template.json \
 eap-camel-jpa-template.json \
 karaf-camel-amq-template.json \
 karaf-camel-log-template.json \
 karaf-camel-rest-sql-template.json \
 karaf-cxf-rest-template.json \
 spring-boot-camel-amq-template.json \
 spring-boot-camel-config-template.json \
 spring-boot-camel-drools-template.json \
 spring-boot-camel-infinispan-template.json \
 spring-boot-camel-rest-sql-template.json \
 spring-boot-camel-teiid-template.json \
 spring-boot-camel-template.json \
 spring-boot-camel-xa-template.json \
 spring-boot-camel-xml-template.json \
 spring-boot-cxf-jaxrs-template.json \
 spring-boot-cxf-jaxws-template.json ;
do
 oc create -n openshift -f \
 https://raw.githubusercontent.com/jboss-fuse/application-templates/application-templates-2.1.fuse-710017-redhat-00006/quickstarts/${template}
done

oc create -n openshift -f https://raw.githubusercontent.com/jboss-fuse/application-templates/application-templates-2.1.fuse-710017-redhat-00006/fis-console-cluster-template.json
oc create -n openshift -f https://raw.githubusercontent.com/jboss-fuse/application-templates/application-templates-2.1.fuse-710017-redhat-00006/fis-console-namespace-template.json
