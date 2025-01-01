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

  # clone {
  #   vm_id = var.nodes[count.index].clone_target
  # }

  memory {
    dedicated = var.nodes[count.index].node_memory
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image[count.index].id
    interface    = "virtio0"
    iothread     = true
    discard      = "ignore"
    file_format  = "raw"
    size         = var.nodes[count.index].node_disk
  }

    disk {
    datastore_id = "local-lvm"
    interface    = "virtio1"
    iothread     = true
    discard      = "ignore"
    file_format  = "raw"
    size         = var.nodes[count.index].additional_node_disk
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.nodes[count.index].node_ip_address
        gateway = var.nodes[count.index].node_gateway
      }
    }
    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config[count.index].id
    meta_data_file_id  = proxmox_virtual_environment_file.metadata_cloud_config[count.index].id
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

}

resource "proxmox_virtual_environment_file" "metadata_cloud_config" {
  count = length(var.nodes)  # Match the count of nodes

  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.nodes[count.index].proxmox_node

  source_raw {
    data = <<-EOF
    #cloud-config
    local-hostname: ${var.nodes[count.index].node_name}
    EOF

    file_name = "metadata-cloud-config-${count.index}.yaml"
  }
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  count = length(var.nodes)  # Match the count of nodes

  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.nodes[count.index].proxmox_node

  source_raw {
    data = <<-EOF
    #cloud-config
    users:
      - default
      - name: ubuntu
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${var.nodes[count.index].node_ssh_keys}
        sudo: ALL=(ALL) NOPASSWD:ALL
    runcmd:
        - apt update
        - apt install -y qemu-guest-agent net-tools
        - timedatectl set-timezone America/Toronto
        - systemctl enable qemu-guest-agent
        - systemctl start qemu-guest-agent
        - echo "done" > /tmp/cloud-config.done
    EOF

    file_name = "user-data-cloud-config-${count.index}.yaml"
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  count = length(var.nodes)
  content_type = "iso"
  datastore_id = "synology-smb"
  node_name    = var.nodes[count.index].proxmox_node
  url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

# output "vm_ipv4_address" {
#   value = proxmox_virtual_environment_vm.ubuntu_vm.ipv4_addresses[1][0]
# }