# terraform-icon-monitor-aws-network

[![open-issues](https://img.shields.io/github/issues-raw/insight-icon/terraform-icon-monitor-aws-network?style=for-the-badge)](https://github.com/insight-icon/terraform-icon-monitor-aws-network/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-icon/terraform-icon-monitor-aws-network?style=for-the-badge)](https://github.com/insight-icon/terraform-icon-monitor-aws-network/pulls)

## Features

This module sets up the network for a monitoring cluster for the ICON blockchain. Sets up the following:

- VPC 
- Security groups 

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl-terraform
module "this" {
  source = "github.com/insight-icon/terraform-icon-monitor-aws-network"
}
```
 
## Examples

- [defaults](https://github.com/insight-icon/terraform-icon-monitor-aws-network/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | The environment | `string` | `""` | no |
| name | The name for the label | `string` | `"prep"` | no |
| namespace | The namespace to deploy into | `string` | `"prod"` | no |
| vpc\_type | The type of vpc | `string` | `"monitoring"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cachet\_security\_group\_id | n/a |
| private\_subnets | n/a |
| public\_subnets | n/a |
| rds\_security\_group\_id | n/a |
| vpc\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [insight-icon](https://github.com/insight-icon)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.