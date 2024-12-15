# Dynamically create VMs.
module "compute-controlplane" {
  source                   = "./compute-controlplane"
  proxmox_api_url          = var.proxmox_api_url
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  nodes                    = local.vm_master_nodes
}
module "computer-worker" {
  source                   = "./compute-worker"
  proxmox_api_url          = var.proxmox_api_url
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  nodes                    = local.vm_worker_nodes
}
