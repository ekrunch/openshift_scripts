#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage : $0 <version tag>"
	echo ""
	echo "Example : \"$0 v3.10.14\" will retrieve containers for OCP 3.10.14"
	echo ""
	echo "More information can be found at the following URL and this script will probably need to be version specific, but for now it works on 3.10"
	echo ""
	echo "https://access.redhat.com/documentation/en-us/openshift_container_platform/3.10/html/installing_clusters/install-config-install-disconnected-install#disconnected-syncing-images"
else
	TAG=$1
	# Infrastructure Components
	docker pull registry.access.redhat.com/openshift3/csi-attacher:$TAG
	docker pull registry.access.redhat.com/openshift3/csi-driver-registrar:$TAG
	docker pull registry.access.redhat.com/openshift3/csi-livenessprobe:$TAG
	docker pull registry.access.redhat.com/openshift3/csi-provisioner:$TAG
	docker pull registry.access.redhat.com/openshift3/efs-provisioner:$TAG
	docker pull registry.access.redhat.com/openshift3/image-inspector:$TAG
	docker pull registry.access.redhat.com/openshift3/local-storage-provisioner:$TAG
	docker pull registry.access.redhat.com/openshift3/manila-provisioner:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-ansible:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-cli:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-cluster-capacity:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-deployer:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-descheduler:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-docker-builder:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-docker-registry:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-egress-dns-proxy:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-egress-http-proxy:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-egress-router:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-f5-router:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-haproxy-router:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-hyperkube:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-hypershift:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-keepalived-ipfailover:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-pod:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-docker-builder:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-node-problem-detector:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-recycler:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-web-console:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-node:$TAG
	docker pull registry.access.redhat.com/openshift3/ose-control-plane:$TAG
	docker pull registry.access.redhat.com/openshift3/registry-console:$TAG
	docker pull registry.access.redhat.com/openshift3/snapshot-controller:$TAG
	docker pull registry.access.redhat.com/openshift3/snapshot-provisioner:$TAG
	docker pull registry.access.redhat.com/rhel7/etcd
	# Logging and Metrics
	docker pull registry.access.redhat.com/openshift3/logging-auth-proxy:$TAG
	docker pull registry.access.redhat.com/openshift3/logging-curator:$TAG
	docker pull registry.access.redhat.com/openshift3/logging-elasticsearch:$TAG
	docker pull registry.access.redhat.com/openshift3/logging-eventrouter:$TAG
	docker pull registry.access.redhat.com/openshift3/logging-fluentd:$TAG
	docker pull registry.access.redhat.com/openshift3/logging-kibana:$TAG
	docker pull registry.access.redhat.com/openshift3/oauth-proxy:$TAG
	docker pull registry.access.redhat.com/openshift3/metrics-cassandra:$TAG
	docker pull registry.access.redhat.com/openshift3/metrics-hawkular-metrics:$TAG
	docker pull registry.access.redhat.com/openshift3/metrics-hawkular-openshift-agent:$TAG
	docker pull registry.access.redhat.com/openshift3/metrics-heapster:$TAG
	docker pull registry.access.redhat.com/openshift3/metrics-schema-installer:$TAG
	docker pull registry.access.redhat.com/openshift3/prometheus:$TAG
	docker pull registry.access.redhat.com/openshift3/prometheus-alert-buffer:$TAG
	docker pull registry.access.redhat.com/openshift3/prometheus-alertmanager:$TAG
	docker pull registry.access.redhat.com/openshift3/prometheus-node-exporter:$TAG
	docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-postgresql
	docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-memcached
	docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-app-ui
	docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-app
	docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-embedded-ansible
	docker pull registry.access.redhat.com/cloudforms46/cfme-openshift-httpd
	docker pull registry.access.redhat.com/cloudforms46/cfme-httpd-configmap-generator
	docker pull registry.access.redhat.com/rhgs3/rhgs-server-rhel7
	docker pull registry.access.redhat.com/rhgs3/rhgs-volmanager-rhel7
	docker pull registry.access.redhat.com/rhgs3/rhgs-gluster-block-prov-rhel7
	docker pull registry.access.redhat.com/rhgs3/rhgs-s3-server-rhel7
	# Openshift Ansible Broker
	docker pull registry.access.redhat.com/openshift3/apb-base:v3.10.14
	docker pull registry.access.redhat.com/openshift3/apb-tools:v3.10.14
	docker pull registry.access.redhat.com/openshift3/ose-service-catalog:v3.10.14
	docker pull registry.access.redhat.com/openshift3/ose-ansible-service-broker:v3.10.14
	docker pull registry.access.redhat.com/openshift3/mariadb-apb:v3.10.14
	docker pull registry.access.redhat.com/openshift3/mediawiki-apb:v3.10.14
	docker pull registry.access.redhat.com/openshift3/mysql-apb:v3.10.14
	docker pull registry.access.redhat.com/openshift3/ose-template-service-broker:v3.10.14
	docker pull registry.access.redhat.com/openshift3/postgresql-apb:v3.10.14
	# S2I
	docker pull registry.access.redhat.com/jboss-amq-6/amq63-openshift
	docker pull registry.access.redhat.com/jboss-datagrid-7/datagrid71-openshift
	docker pull registry.access.redhat.com/jboss-datagrid-7/datagrid71-client-openshift
	docker pull registry.access.redhat.com/jboss-datavirt-6/datavirt63-openshift
	docker pull registry.access.redhat.com/jboss-datavirt-6/datavirt63-driver-openshift
	docker pull registry.access.redhat.com/jboss-decisionserver-6/decisionserver64-openshift
	docker pull registry.access.redhat.com/jboss-processserver-6/processserver64-openshift
	docker pull registry.access.redhat.com/jboss-eap-6/eap64-openshift
	docker pull registry.access.redhat.com/jboss-eap-7/eap70-openshift
	docker pull registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat7-openshift
	docker pull registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift
	docker pull registry.access.redhat.com/openshift3/jenkins-1-rhel7
	docker pull registry.access.redhat.com/openshift3/jenkins-2-rhel7
	docker pull registry.access.redhat.com/openshift3/jenkins-agent-maven-35-rhel7:v3.10.14
	docker pull registry.access.redhat.com/openshift3/jenkins-agent-nodejs-8-rhel7:v3.10.14
	docker pull registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7
	docker pull registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7
	docker pull registry.access.redhat.com/openshift3/jenkins-slave-nodejs-rhel7
	docker pull registry.access.redhat.com/rhscl/mongodb-32-rhel7
	docker pull registry.access.redhat.com/rhscl/mysql-57-rhel7
	docker pull registry.access.redhat.com/rhscl/perl-524-rhel7
	docker pull registry.access.redhat.com/rhscl/php-56-rhel7
	docker pull registry.access.redhat.com/rhscl/postgresql-95-rhel7
	docker pull registry.access.redhat.com/rhscl/python-35-rhel7
	docker pull registry.access.redhat.com/redhat-sso-7/sso70-openshift
	docker pull registry.access.redhat.com/rhscl/ruby-24-rhel7
	docker pull registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift
	docker pull registry.access.redhat.com/redhat-sso-7/sso71-openshift
	docker pull registry.access.redhat.com/rhscl/nodejs-6-rhel7
	docker pull registry.access.redhat.com/rhscl/mariadb-101-rhel7

fi

