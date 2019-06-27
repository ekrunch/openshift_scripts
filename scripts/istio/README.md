# Scripts for deploying the tech preview 11 of Istio on OCP 3.11 / 4.1. 

## ** CAUTION ** This is a work in progress. Please read and review the documentation as well and review every configuration file / script before executing! ** CAUTION **

More information on this preview and documentation can be found here.
https://access.redhat.com/documentation/en-us/openshift_container_platform/3.11/html/service_mesh_install/

To use this, perform the following steps

### OCP 3.11 **only**
Patch all masters using the _patch-master.sh_ script. **Note** : This script applies the contents of *master_config.patch* and will restart master API and controllers.

### OCP 3.11 or OCP 4.x with RHEL compute nodes **only**
Deploy the ElasticSearch configuration to nodes using __cp 99-elasticsearch.conf /etc/sysctl.d/__ and reboot them (If you don't want to restart right away, apply the changes using sysctl.)

### OCP 3.11 or OCP 4.x
1. Review, edit, then execute __1-deploy-istio-operator.sh__ to deploy the Istio operator
2. Review and edit __istio-installation.yaml__ with appropriate settings for your OCP environment.
3. Review, edit, then execite __2-deploy-control-plane.sh__ to deploy the Istio control panel. 

**Note** : Installation took several minutes on a 4 node cluster with 1 master, 1 infra, and 2 compute nodes. Running on 4 VMs on a single Cisco UCS box with 256G of RAM. Your mileage may vary.

**Some useful scripts**

- inject-sidecar.sh - Adds the sidecar to a deployment config. Usage : _inject-sidecar.sh dc/myapp_

**Careful here**, there are no prompts to stop this from happening!
- 98-remove-istio-installation.sh - Removes Istio Installation. 
- 99-remove-istio-operator.sh - Removes Istio Operator.
