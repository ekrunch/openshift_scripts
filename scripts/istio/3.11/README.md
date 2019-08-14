# Scripts for deploying the tech preview 11 of Istio on OCP 3.11


# Note that these will probably not be updated anymore as I no longer have an OCP 3.11 cluster. Feel free to submit a commit if you'd like to continue on with these scripts. :)

## ** CAUTION ** This is a work in progress. Please read and review the documentation as well and review every configuration file / script before executing! ** CAUTION **

More information on this preview and documentation can be found here.
https://access.redhat.com/documentation/en-us/openshift_container_platform/3.11/html/service_mesh_install/

To use this, perform the following steps

### Patch Masters
Patch all masters using the _patch-master.sh_ script. **Note** : This script applies the contents of *master_config.patch* and will restart master API and controllers.

### Update Kernel parameters for ElasticSearch
Deploy the ElasticSearch configuration to nodes using __cp 99-elasticsearch.conf /etc/sysctl.d/__ and reboot them (If you don't want to restart right away, apply the changes using sysctl.)

### Deploy operator, installation manifest, and then control plane
1. Review, edit, then execute __1-deploy-istio-operator.sh__ to deploy the Istio operator
2. Review and edit __istio-installation.yaml__ with appropriate settings for your OCP environment.
3. Review, edit, then execite __2-deploy-control-plane.sh__ to deploy the Istio control panel. 

**Note** : Installation took several minutes on a 4 node cluster with 1 master, 1 infra, and 2 compute nodes. Running on 4 VMs on a single Cisco UCS box with 256G of RAM. Your mileage may vary.

**Some useful scripts**

- inject-sidecar.sh - Adds the sidecar to a deployment config. Usage : _inject-sidecar.sh dc/myapp_

**Careful here**, there are no prompts to stop this from happening!
- 98-remove-istio-installation.sh - Removes Istio Installation. 
- 99-remove-istio-operator.sh - Removes Istio Operator.
