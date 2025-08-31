variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "network_interface_ids" {
  type = list(string)
}

variable "vm_size" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "subnet_id" {
  type = string
}
