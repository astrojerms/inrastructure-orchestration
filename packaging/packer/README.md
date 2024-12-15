# Packer to build and configure VM templates in Proxmox

Requirements:
- sshpass
- ansible-playbook
- packer

Add your customizations to ./vars/local.pkrvars.hcl, as well as your username and public key to ./http/cloud.cfg.

Build the template with this command:

```
packer build -var-file="vars/local.pkrvars.hcl" .
```