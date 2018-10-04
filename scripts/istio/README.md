This directory contains scripts for deploying the tech preview of Istio on OCP 3.10. 

More information on this preview and documentation can be found here.
https://docs.openshift.com/container-platform/3.10/servicemesh-install/servicemesh-install.html#supported-configurations

- istio-installation.yaml - Custom resource file for deploying the service mesh control plane. Edit the username and password as well as the github access token. Note that this is configured for OCP, not OKD/Origin so please read the documentation if you're not using OCP. Note : The custom resource must be called istio-installation, that is, the metadata value for name must be istio-installation.
- deploy-istio.sh - My script for deploying Istio, please read and edit before running!
- patch-master.sh - Script to execute patch, must be run on all masters. please read and edit before running!

- 99-elasticsearch.conf - Deploy to /etc/sysctl.d on each node for elasticsearch to function correctly
- master-config.patch - Patch used to adjust master-config.yaml, must be run on all masters
- sidecar-annotation.yaml - Used in each deployment where you want to enable automatic injection

To use this, do the following

1. Patch all masters using the patch-master.sh **Note : This script will restart master API and controllers**
2. 
