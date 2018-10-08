This directory contains various scripts I use to help manage an OpenShift environment.

- getallresources.sh - This script will gather resources across all projects (namespaces). Example : __"./getallresources.sh svc"__ will retrieve all services in all projects.
- removealldockerimages.sh - Removes all docker images on the machine. Useful for reinstalling OCP and starting with fresh images. **CAUTION** : There's no prompt or anything, it just does. 
- ocpadm.sh - Lazy script to login as system:admin w/o typing so much. :)
- offlinedocker.sh - Downloads OCP images to the local docker registry. Built off of the 3.10 documentation for offline installation, could need additional updates for other versions.
