proxmox_api_user = ""  # API Token ID
proxmox_api_password = "" # API Token


proxmox_host      = "MY_PROXMOX_IP:PORT" # e.g., 192.168.1.123:8006
proxmox_node      = "MY_PROXMOX_NODE"
vm_name           = "template-debian-12-docker"
vmid              = "9000"
cpu_type          = "kvm64"
cores             = "4"
memory            = "7000"
storage_pool      = "local-lvm"
disk_size         = "100G"
disk_format       = "raw"

iso_file         = "local:iso/debian-12.8.0-amd64-netinst.iso"
iso_checksum     = "sha512:f4f7de1665cdcd00b2e526da6876f3e06a37da3549e9f880602f64407f602983a571c142eb0de0eacfc9c1d0f534e9339cdce04eb9daddc6ddfa8cf34853beed"
iso_storage_pool = "local:iso"