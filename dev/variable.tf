variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "subnet_prefix" {
  type = list(string)
}

variable "vm1_name" {
  type = string
}

variable "vm2_name" {
  type = string
}

variable "nic1_name" {
  type = string
}

variable "nic2_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "lb_public_ip_name" {
  type = string
}

variable "bastion_name" {
  type = string
}

variable "bastion_subnet_prefix" {
  type = list(string)
}

variable "bastion_public_ip_name" {
  type = string
}

variable "bastion_subnet_name" {
  type = string
}

