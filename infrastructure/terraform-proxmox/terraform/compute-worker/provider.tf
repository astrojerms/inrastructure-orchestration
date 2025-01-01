# Initial Provider Configuration for Proxmox

terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "bpg/proxmox"
            version = "0.67.1"
        }
    }
}


provider "proxmox" {

    endpoint = var.proxmox_api_url
    api_token = "${var.proxmox_api_token_id}=${var.proxmox_api_token_secret}"
    insecure = true

    ssh {
        agent = true
        username = "root"
    }
}