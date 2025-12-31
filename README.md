# Terraform AWS VPC Basic

[![Terraform](https://img.shields.io/badge/Terraform-1.5+-blue?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)](https://aws.amazon.com/)

## Overview
This repository demonstrates a basic AWS VPC deployment using Terraform, focusing on clean variables, outputs and project structure.


The infrastructure is intentionally simple and cost-free, focusing on best practices:
- clear variable definitions
- usage of `.tfvars`
- reusable module design
- exposing useful outputs

---

## Architecture
This project creates:

- **1 VPC**
- **2 public subnets** (spread across availability zones)
- **1 private subnet**
- **1 Internet Gateway**
- **1 public route table** associated with public subnets

All resources are provisioned using a **custom VPC module**.

### Diagram (ASCII)
```
+---------------------------------------------------+
|                   VPC (10.0.0.0/16)               |
|                                                   |
|   +----------------+    +----------------+        |
|   | Public Subnet  |    | Public Subnet  |        |
|   | 10.0.1.0/24    |    | 10.0.2.0/24    |        |
|   | AZ A           |    | AZ B           |        |
|   +--------+-------+    +--------+-------+        |
|            |                     |                |
|            +---------- IGW ------+                |
|                                                   |
|   +-------------------------------------------+   |
|   | Private Subnet (10.0.3.0/24)               |  |
|   +-------------------------------------------+   |
+---------------------------------------------------+
```

---

## Project Structure
```
.
├── main.tf
├── providers.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
    └── vpc/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── data.tf
```

---

## Variables (Root Module)

| Name | Type | Description | Default |
|----|----|----|----|
| `aws_region` | string | AWS region | `eu-west-1` |
| `project_name` | string | Project name used for tagging | `dev` |
| `vpc_cidr` | string | CIDR block for the VPC | `10.0.0.0/16` |
| `public_subnets_cidr` | list(string) | CIDRs for public subnets | — |
| `private_subnet_cidr` | string | CIDR for private subnet | — |
| `tags` | map(string) | Common resource tags | `{ Environment = "dev" }` |

Values are overridden using `terraform.tfvars`.

---

## Outputs

| Name | Description |
|----|----|
| `vpc_id` | ID of the created VPC |
| `vpc_cidr` | CIDR block of the VPC |
| `public_subnet_ids` | IDs of public subnets |
| `private_subnet_id` | ID of the private subnet |

---

## Prerequisites
- AWS account
- AWS CLI configured (`aws configure`)
- Terraform **>= 1.5**

---

## Usage

```bash
terraform init
terraform plan
terraform apply
```

View outputs:
```bash
terraform output
```

---

## Cleanup
To remove all created resources:
```bash
terraform destroy
```

---

## Cost Considerations
This project only creates **free-tier networking resources**:
- VPC
- Subnets
- Route tables
- Internet Gateway

⚠️ No EC2, NAT Gateway, Load Balancer, or traffic-generating resources are created.
Running this project **does not incur AWS costs**.

---

## Security Notes
- Never commit AWS credentials
- Use IAM users/roles with least privilege
- Avoid hardcoding sensitive values

---

## Portfolio Notes
- Used Terraform modules for reusable infrastructure
- Practiced variable types: `string`, `list`, `map`
- Leveraged `.tfvars` for environment configuration
- Exposed infrastructure data via outputs
- Followed clean Terraform project structure and conventions
