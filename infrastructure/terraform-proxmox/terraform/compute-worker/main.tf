resource "proxmox_virtual_environment_vm" "computer-worker" {
  count = length(var.nodes)
  name      = var.nodes[count.index].node_name
  node_name = var.nodes[count.index].proxmox_node

  agent {
    enabled = true
  }

  cpu {
    cores = var.nodes[count.index].node_cpu_cores
  }

  clone {
    vm_id = var.nodes[count.index].clone_target
  }

  memory {
    dedicated = var.nodes[count.index].node_memory
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "ignore"
    size         = var.nodes[count.index].node_disk
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.nodes[count.index].node_ip_address
        gateway = var.nodes[count.index].node_gateway
      }
    }
    user_account {
      username = var.nodes[count.index].node_username
      password = var.nodes[count.index].node_password
      keys    = [trimspace(var.nodes[count.index].node_ssh_keys)]
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve"
  url = "https://cloud-images.ubuntu.com/oracular/current/oracular-server-cloudimg-amd64.img"
}

# output "vm_ipv4_address" {
#   value = proxmox_virtual_environment_vm.ubuntu_vm.ipv4_addresses[1][0]
# }