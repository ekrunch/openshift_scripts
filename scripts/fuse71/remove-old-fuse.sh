#!/bin/bash

oc login -u system:admin
#oc project openshift

# Remove old image streams

echo Removing old templates

for oldimagestream in s2i-fuse71-eap-camel-amq \
 s2i-fuse71-eap-camel-cdi \
 s2i-fuse71-eap-camel-cxf-jaxrs \
 s2i-fuse71-eap-camel-cxf-jaxws \
 s2i-fuse71-eap-camel-jpa \
 s2i-fuse71-karaf-camel-amq \
 s2i-fuse71-karaf-camel-log \
 s2i-fuse71-karaf-camel-rest-sql \
 s2i-fuse71-karaf-cxf-rest \
 s2i-fuse71-spring-boot-camel-amq \
 s2i-fuse71-spring-boot-camel-config \
 s2i-fuse71-spring-boot-camel-drools \
 s2i-fuse71-spring-boot-camel-infinispan \
 s2i-fuse71-spring-boot-camel-rest-sql \
 s2i-fuse71-spring-boot-camel-teiid \
 s2i-fuse71-spring-boot-camel \
 s2i-fuse71-spring-boot-camel-xa \
 s2i-fuse71-spring-boot-camel-xml \
 s2i-fuse71-spring-boot-cxf-jaxrs \
 s2i-fuse71-spring-boot-cxf-jaxws \
 fuse70-console \
 fuse70-console-cluster \
 fuse71-console \
 fuse71-console-cluster \
 s2i-fuse70-eap-camel-cdi \
 s2i-fuse70-eap-camel-cxf-jaxrs \
 s2i-fuse70-eap-camel-cxf-jaxws \
 s2i-fuse70-eap-camel-jpa \
 s2i-fuse70-karaf-camel-amq \
 s2i-fuse70-karaf-camel-log \
 s2i-fuse70-karaf-camel-rest-sql \
 s2i-fuse70-karaf-cxf-rest \
 s2i-fuse70-spring-boot-camel \
 s2i-fuse70-spring-boot-camel-amq \
 s2i-fuse70-spring-boot-camel-config \
 s2i-fuse70-spring-boot-camel-drools \
 s2i-fuse70-spring-boot-camel-infinispan \
 s2i-fuse70-spring-boot-camel-teiid \
 s2i-fuse70-spring-boot-camel-xml \
 s2i-fuse70-spring-boot-cxf-jaxrs \
 s2i-fuse70-spring-boot-cxf-jaxws ;
do
 oc delete template/${oldimagestream} -n openshift
done

echo Removing old image streams

for imagestream in fis-java-openshift \
 jboss-fuse70-java-openshift \
 fis-karaf-openshift \
 jboss-fuse70-karaf-openshift \
 jboss-fuse70-eap-openshift \
 jboss-fuse70-console \
 fuse7-java-openshift \
 fuse7-karaf-openshift \
 fuse7-eap-openshift \
 fuse7-console ;
do
 oc delete imagestream/${imagestream} -n openshift
done
