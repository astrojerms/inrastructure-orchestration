# tjh-infra

This repository manages the infrastructure and application deployments using **Packer**, **Terraform**, **Ansible**, **Argocd**, and **Helm**.

## Directory Structure

- **packaging/**: Packer code to generate templates in the host cloud environment. Currently, the code there only deploys a template to the target proxmox server.
- **infrastructure/**: Terraform code to manage infrastructure in the target cloud. The code here currently deploys instances to proxmox or aws.
- **installation/**: Ansible code to install and conifgure on the target infrastructure. The existing code installs k8s into the target debian systems with kubeadm, and does some initial setup.
- **deployment/**: Deploys k8s applications with argocd. Helm chart defines custom created charts, which are used in conjunction with argocd.
- **.github/**: Defines a github workflow to deploy the aws infrastructure and helm applications.

