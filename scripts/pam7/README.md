### Process Automation Manager 7 in OCP

These scripts are for deploying / managing PAM 7 in OCP

- genpam7keys.sh - Creates the neccessary keystore files for PAM 7 in OCP. **NOT** to be used for production environments as it makes self signed certs with poor passwords and generic DNs. Example : __"./genpam7keys.sh rhpam7-demo redhat123"__




Example of how to deploy a PAM 7 authoring environment in OCP 3.10

```bash
oc new-project rhpam7-demo --display-name="RH Process Automation Manager 7 Demo"
/genpam7keys.sh rhpam7-demo redhat123
```
