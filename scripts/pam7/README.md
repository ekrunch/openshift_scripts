### Process Automation Manager 7 in OCP

These scripts are for deploying / managing PAM 7 in OCP

- genpam7keys.sh - Creates the neccessary keystore files for PAM 7 in OCP. **NOT** to be used for production environments as it makes self signed certs with poor passwords and generic DNs. Example : __"./genpam7keys.sh rhpam7-demo redhat123"__
- createpam7authoringdemo.sh - Creates a project, calls the genpam7keys and generals a manifest of parameters, then calls __oc new-app__ to create an installation of the __rhpam70-authoring__ template.

Note that the script uses the __rhpam70-authoring__ template, which does require PVs. If you want to use the ephemeral templates, either edit the script or run the commands manually. If you have an NFS server and are looking for a dynamic PV provisioner built around NFS, the following scripts can be helpful.
https://github.com/ekrunch/openshift_scripts/tree/master/3.10/pv/nfs-client

Example of how to deploy a PAM 7 authoring environment in OCP 3.10

```bash
createpam7authoringdemo.sh rhpam7-demo redhat123
```
