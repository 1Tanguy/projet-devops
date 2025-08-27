variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
  default     = "rg-TArricot2024_cours-projet"
}

variable "project" {
  description = "Préfixe du projet pour nommer les ressources"
  type        = string
  default     = "demo-aks"
}

# Variable pour subscription
variable "subscription_id" {
  description = "ID de la subscription Azure à utiliser"
  type        = string
  default     = "ca5c57dd-3aab-4628-a78c-978830d03bbd"
}

variable "location" {
  description = "Région Azure"
  type        = string
  default     = "francecentral"
}

variable "k8s_version" {
  description = "Version AKS (laisser vide pour auto)"
  type        = string
  default     = ""
}

variable "node_vm_size" {
  description = "Taille des VMs du node pool"
  type        = string
  default     = "Standard_DS3_v2"
}

variable "node_count" {
  description = "Nombre de nœuds (si autoscaler inactif)"
  type        = number
  default     = 2
}

# Réseau
variable "vnet_cidr" {
  description = "CIDR du VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR du Subnet AKS"
  type        = string
  default     = "10.0.1.0/24"
}
