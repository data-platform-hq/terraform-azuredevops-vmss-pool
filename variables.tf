variable "vm_scale_set_name" {
  description = "VM Scale Sets name"
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type        = string
}

variable "subnet_id" {
  description = "Subnet where VM Scale Sets would be provisioned"
  type        = string
}

variable "ado_project_name" {
  description = "Target Azure DevOps Project name where VMSS agent pool would be provisioned"
  type        = string
}

variable "ado_service_connection_azurerm_name" {
  description = "Name of existing Azure DevOps Service Connection AzureRM that points to Azure Subscription with VMSS used in agent pool"
  type        = string
}

variable "ado_vmss_pool_name" {
  description = "Given name to Azure DevOps VMSS agent pool"
  type        = string
}

variable "ado_vmss_pool_configuration" {
  description = "Object with configuration options for Azure DevOps VMSS agent pool"
  type = object({
    desired_idle           = optional(number, 0)
    max_capacity           = optional(number, 3)
    time_to_live_minutes   = optional(number, 30)
    recycle_after_each_use = optional(bool, false)
  })
  default = {}
}
