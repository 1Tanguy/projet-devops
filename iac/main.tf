terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.100.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.29.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

# Suffixe aléatoire pour noms uniques
resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

# Resource Group existant
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# ---------------------
# Réseau : VNet + Subnet
# ---------------------
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "${var.project}-vnet-${random_string.suffix.result}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = [var.vnet_cidr]

  tags = {
    projet = var.project
    user   = "TArricot2024"
  }
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.subnet_cidr]
}

# ---------------------
# Cluster AKS
# ---------------------
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.project}-aks-${random_string.suffix.result}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "${var.project}-${random_string.suffix.result}"
  kubernetes_version  = var.k8s_version != "" ? var.k8s_version : null
  sku_tier            = "Standard"

  default_node_pool {
    name                        = "system"
    vm_size                     = var.node_vm_size
    os_disk_size_gb             = 100
    type                        = "VirtualMachineScaleSets"
    only_critical_addons_enabled = true
    node_count                  = var.node_count
    orchestrator_version        = var.k8s_version != "" ? var.k8s_version : null
    vnet_subnet_id              = azurerm_subnet.aks_subnet.id

    upgrade_settings {
      max_surge = "33%"
    }
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    dns_service_ip     = "10.0.2.10"
    service_cidr       = "10.0.2.0/24"
    # Supprime cette ligne :
    # docker_bridge_cidr = "172.17.0.1/16"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  tags = {
    cours     = "cours-projet"
    promotion = "HASDO_001"
    user      = "TArricot2024"
  }
}