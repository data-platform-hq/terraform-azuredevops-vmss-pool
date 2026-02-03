# [1.3.0](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.2.0...v1.3.0) (2026-02-03)


### Features

* upgrade provider to AzureRM v4.0 ([6442a53](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/6442a53b59d8a4943908a509ebe775552642807a))

# [1.2.0](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.1.7...v1.2.0) (2024-09-16)


### Features

* upgrade to azurerm v4 ([3a619f1](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/3a619f1b2513715dd1d8cf9126962bad4c192fdd))

## [1.1.7](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.1.6...v1.1.7) (2024-06-20)


### Bug Fixes

* disable public ip assignment by default ([e685539](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/e68553930c512e8cde80cc59912228a00d22804d))

## [1.1.6](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.1.5...v1.1.6) (2024-06-20)


### Bug Fixes

* update vmss version to 1.2.6 ([99bbe01](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/99bbe0178da178bcacc1cc0aa882953d163ce813))

## [1.1.5](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.1.4...v1.1.5) (2024-06-11)


### Bug Fixes

* add variable to support identities ([41c1963](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/41c19636ddf8eb8b51af711112c137abd27c1798))
* support identity block in vmss ([092338c](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/092338ccc819a84a19248700cadecab495f91ef3))

## [1.1.4](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.1.3...v1.1.4) (2024-05-20)


### Bug Fixes

* replaced pre-commit repo docs creation/update by GH Actions ([f3dc283](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/f3dc28374af3703ac70da1f2520206ab2a87ff37))
* vmss default instances set to 0 ([49dabac](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/49dabacb882d1f980d803d71f3692b905de16777))

## [1.1.3](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.1.2...v1.1.3) (2024-02-01)


### Bug Fixes

* support dcr ([ee605b9](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/ee605b9ef260c9a193e60e021b539bd36c21b3ee))

## [1.1.2](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.1.1...v1.1.2) (2024-01-25)


### Bug Fixes

* updated vmss module version ([ee4e502](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/ee4e502bc18b296d3e13108178a35594d230cea3))

## [1.1.1](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.1.0...v1.1.1) (2024-01-24)


### Bug Fixes

* added tags for vmss module ([d9dfa56](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/d9dfa5654573d50df14fe547b2abd723992bb1f0))
* added tags var ([51d06e3](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/51d06e3ddd70b65472aa3d3be3e2026bab9fc488))

# [1.1.0](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.0.3...v1.1.0) (2024-01-09)


### Bug Fixes

* added resource index ([5c293f2](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/5c293f2d96bca6e5d25c88508464e0b94a5add6b))
* fmt ([d0891cf](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/d0891cf1c86a27bc5cb42a80305aeb43fe60bc71))


### Features

* added bool variable ([381fc7d](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/381fc7d294e38780b3774f9fd7f84e94d2cc068a))
* made ado resources optional ([c1da277](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/c1da27763ee7b9d847d755a9a85f4707e2276c02))

## [1.0.3](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.0.2...v1.0.3) (2023-12-24)


### Bug Fixes

* updated vmss module version; added var for public ip prefix ([18361f6](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/18361f60e5c57e0d652e1aa3d7b08fca7726e64d))

## [1.0.2](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.0.1...v1.0.2) (2023-12-05)


### Bug Fixes

* removed zip package installation ([1d62efe](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/1d62efe22c97b4ae624ea76ed9c36970beb8bbc2))

## [1.0.1](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/compare/v1.0.0...v1.0.1) (2023-11-30)


### Bug Fixes

* updated prerequisite script; added tls_key output ([c958e70](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/c958e70c7982ee988e9a45e383c56753649965d2))

# 1.0.0 (2023-11-30)


### Features

* vmss pool ([6595e4f](https://github.com/data-platform-hq/terraform-azuredevops-vmss-pool/commit/6595e4fbe6455f29f4adc1ac4dad57c70f10fb7f))
