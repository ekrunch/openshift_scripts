### Process Automation Manager 7.1 in OCP

These scripts are for deploying / managing PAM 7 in OCP. They assume that you've followed the installation instructions for PAM 7 on OCP. If you have not, these scripts will not be able to find the template names. The OCP scripts are found in the downloads site for PAM 7.

**NOTE** : Assumes that RH PAM 7.1 scripts have been deployed. These templates must be downloaded from Red Hat (https://access.redhat.com). The filename is __rhpam-7.1.1-openshift-templates.zip__. Once that file is unzipped, change to the directory and run the following.
```bash
oc create -f rhpam71-image-streams.yaml
cd templates
ls rhpam7* | xargs -n1 oc create -f
```

- genpam7keys.sh - Creates the neccessary keystore files for PAM 7 in OCP. **NOT** to be used for production environments as it makes self signed certs with poor passwords and generic DNs. Example : __"./genpam7keys.sh rhpam7-demo redhat123"__
- createpam7authoringdemo.sh - Creates a project, calls the genpam7keys and generals a manifest of parameters, then calls __oc new-app__ to create an installation of the __rhpam70-authoring__ template.
- removepam.sh - Removes **all** rhpam templates/images. __Careful. Please review first. :)__

Note that the script uses the __rhpam71-authoring__ template, which does require PVs. If you want to use the ephemeral templates, either edit the script or run the commands manually. If you have an NFS server and are looking for a dynamic PV provisioner built around NFS, the following scripts can be helpful.
https://github.com/ekrunch/openshift_scripts/tree/master/3.10/pv/nfs-client

Example of how to deploy a PAM 7.1 authoring environment in OCP 3.10

```bash
createpam7authoringdemo.sh rhpam7-demo redhat123
```
