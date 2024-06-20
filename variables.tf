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

variable "ado_vmss_public_ip_prefix_enabled" {
  description = "Boolean flag that determines whether Public IP Prefix is assigned to VM Scale Sets"
  type        = bool
  default     = false
}

variable "create_ado_resources" {
  description = "Boolean flag that determines whether ADO resources will be created"
  type        = bool
  default     = true
}

variable "scale_set_configuration" {
  description = "Configuration options for linux virtual machine scale set"
  type = object({
    sku                             = optional(string)
    instances                       = optional(string)
    admin_username                  = optional(string)
    admin_password                  = optional(string)
    disable_password_authentication = optional(bool)
    priority                        = optional(string)
    overprovision                   = optional(bool)
    single_placement_group          = optional(bool)
    upgrade_mode                    = optional(string)
    enable_ip_forwarding_interface  = optional(bool)
    domain_name_label               = optional(string)
    lb_backend_address_pool_ids     = optional(list(string))
  })
  default = {
    instances = "0"
  }
}

variable "analytics_workspace_id" {
  type        = string
  description = "Resource ID of Log Analytics Workspace"
  default     = null
}

variable "drc_enabled" {
  type        = bool
  description = "Enable data collection rule. var.analytics_workspace_id must be provided"
  default     = false
}

variable "drc_datasource_name" {
  type        = string
  description = "Datasource syslog name"
  default     = "datasource-syslog"
}

variable "drc_facility_names" {
  type        = list(string)
  description = "List of Facility names"
  default     = ["daemon", "syslog", "user"]
}

variable "drc_log_levels" {
  type        = list(string)
  description = "List of Log levels"
  default     = ["Debug"]
}

variable "identity_ids" {
  type        = list(string)
  description = "List of user assigned identity IDs"
  default     = null
}
