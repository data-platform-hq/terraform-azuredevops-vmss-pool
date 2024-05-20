# Azure Devops VMSS Elastic Pool Terraform module
Terraform module for creation Azure Devops VMSS Elastic Pool

## Usage
```hcl
data "azurerm_subnet" "example" {
  name                 = "example-name"
  virtual_network_name = "example-vnet-name"
  resource_group_name  = "example-rg"
}

module "ado_vmss_agent_pool" {
  source  = "data-platform-hq/vmss-pool/azuredevops"
  version = "~> 1.0"

  vm_scale_set_name                   = "example-vm-scale-set"
  location                            = "eastus"
  resource_group                      = "example-rg"
  subnet_id                           = data.azurerm_subnet.example.id
  ado_project_name                    = "datahq"
  ado_service_connection_azurerm_name = "example-ado-service-connection-name"
  ado_vmss_pool_name                  = "example-ado-vmss-pool-name"
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | >= 0.10.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.75.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | >= 0.10.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 4.0.5 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vmss"></a> [vmss](#module\_vmss) | data-platform-hq/vmss/azurerm | 1.2.3 |

## Resources

| Name | Type |
|------|------|
| [azuredevops_agent_queue.this](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/agent_queue) | resource |
| [azuredevops_elastic_pool.this](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/elastic_pool) | resource |
| [azuredevops_pipeline_authorization.this](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/pipeline_authorization) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azuredevops_project.this](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/project) | data source |
| [azuredevops_serviceendpoint_azurerm.this](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/serviceendpoint_azurerm) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ado_project_name"></a> [ado\_project\_name](#input\_ado\_project\_name) | Target Azure DevOps Project name where VMSS agent pool would be provisioned | `string` | n/a | yes |
| <a name="input_ado_service_connection_azurerm_name"></a> [ado\_service\_connection\_azurerm\_name](#input\_ado\_service\_connection\_azurerm\_name) | Name of existing Azure DevOps Service Connection AzureRM that points to Azure Subscription with VMSS used in agent pool | `string` | n/a | yes |
| <a name="input_ado_vmss_pool_configuration"></a> [ado\_vmss\_pool\_configuration](#input\_ado\_vmss\_pool\_configuration) | Object with configuration options for Azure DevOps VMSS agent pool | <pre>object({<br>    desired_idle           = optional(number, 0)<br>    max_capacity           = optional(number, 3)<br>    time_to_live_minutes   = optional(number, 30)<br>    recycle_after_each_use = optional(bool, false)<br>  })</pre> | `{}` | no |
| <a name="input_ado_vmss_pool_name"></a> [ado\_vmss\_pool\_name](#input\_ado\_vmss\_pool\_name) | Given name to Azure DevOps VMSS agent pool | `string` | n/a | yes |
| <a name="input_ado_vmss_public_ip_prefix_enabled"></a> [ado\_vmss\_public\_ip\_prefix\_enabled](#input\_ado\_vmss\_public\_ip\_prefix\_enabled) | Boolean flag that determines whether Public IP Prefix is assigned to VM Scale Sets | `bool` | `true` | no |
| <a name="input_analytics_workspace_id"></a> [analytics\_workspace\_id](#input\_analytics\_workspace\_id) | Resource ID of Log Analytics Workspace | `string` | `null` | no |
| <a name="input_create_ado_resources"></a> [create\_ado\_resources](#input\_create\_ado\_resources) | Boolean flag that determines whether ADO resources will be created | `bool` | `true` | no |
| <a name="input_drc_datasource_name"></a> [drc\_datasource\_name](#input\_drc\_datasource\_name) | Datasource syslog name | `string` | `"datasource-syslog"` | no |
| <a name="input_drc_enabled"></a> [drc\_enabled](#input\_drc\_enabled) | Enable data collection rule. var.analytics\_workspace\_id must be provided | `bool` | `false` | no |
| <a name="input_drc_facility_names"></a> [drc\_facility\_names](#input\_drc\_facility\_names) | List of Facility names | `list(string)` | <pre>[<br>  "daemon",<br>  "syslog",<br>  "user"<br>]</pre> | no |
| <a name="input_drc_log_levels"></a> [drc\_log\_levels](#input\_drc\_log\_levels) | List of Log levels | `list(string)` | <pre>[<br>  "Debug"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which all resources in this example should be created. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group. | `string` | n/a | yes |
| <a name="input_scale_set_configuration"></a> [scale\_set\_configuration](#input\_scale\_set\_configuration) | Configuration options for linux virtual machine scale set | <pre>object({<br>    sku                             = optional(string)<br>    instances                       = optional(string)<br>    admin_username                  = optional(string)<br>    admin_password                  = optional(string)<br>    disable_password_authentication = optional(bool)<br>    priority                        = optional(string)<br>    overprovision                   = optional(bool)<br>    single_placement_group          = optional(bool)<br>    upgrade_mode                    = optional(string)<br>    enable_ip_forwarding_interface  = optional(bool)<br>    domain_name_label               = optional(string)<br>    lb_backend_address_pool_ids     = optional(list(string))<br>  })</pre> | <pre>{<br>  "instances": "0"<br>}</pre> | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet where VM Scale Sets would be provisioned | `string` | n/a | yes |
| <a name="input_vm_scale_set_name"></a> [vm\_scale\_set\_name](#input\_vm\_scale\_set\_name) | VM Scale Sets name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ado_elastic_pool_name"></a> [ado\_elastic\_pool\_name](#output\_ado\_elastic\_pool\_name) | Azure DevOps VMSS pool name |
| <a name="output_public_ip_prefix"></a> [public\_ip\_prefix](#output\_public\_ip\_prefix) | Public IP Address Prefix CIDR |
| <a name="output_tls_key"></a> [tls\_key](#output\_tls\_key) | SSH Key for VMSS authorization |
| <a name="output_vmss_id"></a> [vmss\_id](#output\_vmss\_id) | VM Scale Sets id |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/tree/master/LICENSE)
