### NFS Client Provisioner example

Example created using the NFS-Client Provisioner from the Kubernetes external-storage incubator using the Quay.io Docker image. Instructions have been updated and tested on 3.10.

For more information, go to https://github.com/kubernetes-incubator/external-storage/tree/master/nfs-client

In my case, I create a new project called "nfs-provisioner", then executed the auth scripts (in the auth subdirectory of this repo) in order. I've numbered them in the order to execute.

__Create Project and switch to it__

```bash
oc new-project nfs-provisioner --display-name="NFS Provisioner"
oc project nfs-provisioner
```

__Create Cluster Role, Service Account, and Cluster Role Binding__

```bash
oc create -f auth/1-openshift-clusterrole.yaml
oc create -f auth/2-serviceaccount.yaml
oc create -f auth/3-clusterrolebinding.yaml
```

__Next you have to grant permissions or the nfs client container won't start up due to permissions issues.__

```bash
oc adm policy add-scc-to-user hostmount-anyuid system:serviceaccount:nfs-provisioner:nfs-client-provisioner
oc adm policy add-cluster-role-to-user nfs-client-provisioner-runner system:serviceaccount:nfs-provisioner:nfs-client-provisioner
```

__Execute the deployment manifest to create the container and deploy it.__

*Note : Edit the deployment-nfs-client-provisioner.yaml before running! It contains the mount point and credentials for the NFS server.*

```bash
oc create -f deployment-nfs-client-provisioner.yaml
```

__Now create the storage class__
```bash
oc create -f storageclass-managed-nfs-storage.yml
```
