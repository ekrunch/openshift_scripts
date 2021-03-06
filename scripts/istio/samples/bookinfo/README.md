This directory contains scripts for deploying the bookinfo sample to test Istio

** CAUTION ** This is a work in progress. Please read and review the documentation as well and review every configuration file / script before executing! ** CAUTION **

More information on this preview and documentation can be found here.
https://access.redhat.com/documentation/en-us/openshift_container_platform/3.11/html/service_mesh_install/

To use this, perform the following steps

1. Review, edit, then execite __1-create-bookinfo-sample.sh__ to deploy the bookinfo sample into a namespace called bookinfo. (Edit the script if you'd like to change the namespace)
2. Review, edit, then execite __test-bookinfo-gateway.sh__ to test the bookinfo sample and review the data for Istio. It should return a 200 when it's working correctly and traces should start appearing in applications.
3. Apply destination rules using the script __2-create-destination-rules.sh__. **Note** : This does not have mutual TLS enabled. See the documentation for information on how to do this when using mutual TLS.
4. Review, edit, then execute __3-create-ratings-v2.sh__. This script deploys the reviews-v2 service in both MongoDB and MySQL flavors. This will allow the user to see how Istio / Kiali handle TCP based traffic.

**Note** : Installation took several minutes on a 4 node cluster with 1 master, 1 infra, and 2 compute nodes. Running on 4 VMs on a single Cisco UCS box with 192G of RAM. Your mileage may vary.
