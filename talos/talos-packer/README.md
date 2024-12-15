# Packer
### Builds an image template with Talos in Proxmox

- Configuration is in ./vars/example.local.pkrcvars.hcl
    - Make a copy of the above file and name it local.pkrcvars.hcl then enter your cluster specifics
- Run with:

```
packer build -var-file="vars/local.pkrvars.hcl" .
```