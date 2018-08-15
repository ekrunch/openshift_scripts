### Process Automation Manager 7 in OCP

These scripts are for deploying / managing PAM 7 in OCP

- genpam7keys.sh - Creates the neccessary keystore files for PAM 7 in OCP. **NOT** to be used for production environments as it makes self signed certs with poor passwords and generic DNs. Example : __"./genpam7keys.sh rhpam7-demo redhat123"__
