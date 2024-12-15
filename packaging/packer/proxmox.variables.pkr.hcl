variable "iso_file" {
  type    = string
  default = ""
}

variable "iso_url" {
  type    = string
  default = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.8.0-amd64-netinst.iso"
}

variable "iso_storage_pool" {
  type    = string
  default = ""
}

variable "iso_checksum" {
  type    = string
  default = "sha512:f4f7de1665cdcd00b2e526da6876f3e06a37da3549e9f880602f64407f602983a571c142eb0de0eacfc9c1d0f534e9339cdce04eb9daddc6ddfa8cf34853beed"
}

variable "vm_name" {
  type = string
  default = "pckr-tmpl-debian-12"
}

variable "vmid" {
  type = string
  description = "Proxmox Template ID"
  default = "9999"
}

variable "cpu_type" {
  type    = string
  default = "kvm64"
}

variable "cores" {
  type    = string
  default = "4"
}

variable "disk_format" {
  type    = string
  default = "raw"
}

variable "disk_size" {
  type    = string
  default = "100G"
}

variable "storage_pool" {
  type    = string
  default = ""
}

variable "memory" {
  type    = string
  default = "7000"
}

variable "network_vlan" {
  type    = string
  default = ""
}

variable "proxmox_api_password" {
  type      = string
  sensitive = true
  default   = ""
}

variable "proxmox_api_user" {
  type    = string
  default = "root@pam"
}

variable "proxmox_host" {
  type    = string
  default = ""
}

variable "proxmox_node" {
  type    = string
  default = ""
}