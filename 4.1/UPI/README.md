# 4.1 UPI Configurations

This is a few tidbits I've pulled together for using a UPI installation of OCP 4.1

- haproxy-bootstrap.cfg	- This is an HAProxy configuration for the required load balancing in OCP 4.1. Tested with VMware and working. Should work for bare metal too, just change the host names and IP address, the ports are correct. This configuration is for bootstrapping the cluster where the bootstrap machine is still active.
- haproxy-run.cfg - This configuration is identical except the bootstrap is removed. Follow the documentation for the appropriate time to remove the bootstrap node.
