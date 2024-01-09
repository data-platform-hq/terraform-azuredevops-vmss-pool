resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

module "vmss" {
  source  = "data-platform-hq/vmss/azurerm"
  version = "1.2.0"

  scale_set_name           = var.vm_scale_set_name
  location                 = var.location
  resource_group           = var.resource_group
  admin_ssh_key            = { public_key = tls_private_key.this.public_key_openssh }
  subnet_id                = var.subnet_id
  public_ip_prefix_enabled = var.ado_vmss_public_ip_prefix_enabled
}

data "azuredevops_project" "this" {
  count = var.create_ado_resources ? 1 : 0
  name = var.ado_project_name
}

data "azuredevops_serviceendpoint_azurerm" "this" {
  count = var.create_ado_resources ? 1 : 0
  project_id            = data.azuredevops_project.this[0].id
  service_endpoint_name = var.ado_service_connection_azurerm_name
}

resource "azuredevops_elastic_pool" "this" {
  count = var.create_ado_resources ? 1 : 0
  name                   = var.ado_vmss_pool_name
  service_endpoint_id    = data.azuredevops_serviceendpoint_azurerm.this[0].id
  service_endpoint_scope = data.azuredevops_project.this[0].id
  azure_resource_id      = module.vmss.id
  desired_idle           = var.ado_vmss_pool_configuration.desired_idle
  max_capacity           = var.ado_vmss_pool_configuration.max_capacity
  time_to_live_minutes   = var.ado_vmss_pool_configuration.time_to_live_minutes
  recycle_after_each_use = var.ado_vmss_pool_configuration.recycle_after_each_use
}

resource "azuredevops_agent_queue" "this" {
  count = var.create_ado_resources ? 1 : 0
  project_id    = data.azuredevops_project.this[0].id
  agent_pool_id = azuredevops_elastic_pool.this[0].id
}

resource "azuredevops_pipeline_authorization" "this" {
  count = var.create_ado_resources ? 1 : 0
  project_id  = data.azuredevops_project.this[0].id
  resource_id = azuredevops_agent_queue.this[0].id
  type        = "queue"
}
