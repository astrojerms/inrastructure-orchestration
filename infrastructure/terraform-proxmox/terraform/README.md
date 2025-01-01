Terrafrom to deploy VM infrastructure to Proxmox.

To do:
- define VM infra for production K8s applications
- define additional test infra - test cluster, test linux VMs, etc.
- define infrastructure for other associated infrastructure - monitoring, build tools, object storage, etc.

Install with cloud images using cloud-init to configure, then do additional installation with ansible.

RKE2 for production K8s cluster
k3s for test k8s cluster
Ubuntu cloud images