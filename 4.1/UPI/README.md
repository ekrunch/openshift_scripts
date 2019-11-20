# 4.1 UPI Configurations

This is a few tidbits I've pulled together for using a UPI installation of OCP 4.1

- haproxy-run.cfg - This is an HAProxy configuration for the required load balancing in OCP 4.1. Tested with VMware and working. Should work for bare metal too, just change the host names and IP address, the ports are correct. This configuration is for bootstrapping and running the cluster. After bootstrap is complete, you can remove the bootstrap node if desired.
