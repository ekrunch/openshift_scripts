# Scripts for deploying the tech preview 12 of Istio on OCP 4.1

## ** CAUTION ** This is a work in progress. Please read and review the documentation as well and review every configuration file / script before executing! ** CAUTION **

More information on this preview and documentation can be found here.
https://docs.openshift.com/container-platform/4.1/service_mesh/service_mesh_install/understanding-ossm.html

To use this, perform the following steps

### Deploy operator, installation manifest, and then control plane
1. Review, edit, then execute __1-deploy-istio-operator.sh__ to deploy the Istio operator
2. Review and edit __istio-installation.yaml__ with appropriate settings for your OCP environment.
3. Review, edit, then execite __2-deploy-control-plane.sh__ to deploy the Istio control panel. 

1. Review, edit, then execute __1-deploy-jaeger-operator.sh__, __2-deploy-kiali-operator.sh__, and __3-deploy-service-mesh-operator.sh__
2. Edit the __istio-installation.yaml__ and then execute __4-deploy-control-plane.sh__ to deploy it.

