### Sample inventory files

__Full Configuration Files__
- inventory.4node - Basic 4 node inventory. 1 Master, 1 Infra, 2 Worker nodes. This is bare bones and only configures basic functionality.

__Fragments__

These files are **not** complete inventory files and should be added to an existing inventory to enable features. View each file for details on usage and documentation links. All of these files use PVCs so you'll need to build PVs manually or use a dynamic provisioner.

- inventory.fragment.prometheus - Add support for Prometheus
- inventory.fragment.cfme - Add support for CloudForms
- inventory.fragment.grafana - Add support for Grafana (Requires Prometheus. Unsupported but works in OCP 3.10)
