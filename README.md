# AWS Infrastructure with Terraform

Infrastructure-as-Code project demonstrating automated provisioning of AWS cloud resources using Terraform.

## Architecture

This project provisions a complete AWS infrastructure stack including:
- **VPC** with custom CIDR block and DNS support
- **Public Subnet** with internet gateway routing
- **EC2 Instance** (Amazon Linux 2) with automated web server setup
- **Security Group** with HTTP and SSH access controls
- **Internet Gateway** for public internet connectivity

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with credentials
- AWS account with appropriate permissions

## Project Structure

```
terraform-aws-infrastructure/
├── main.tf         # Core infrastructure resources
├── variables.tf    # Input variables and defaults
├── outputs.tf      # Output values after deployment
└── README.md       # Project documentation
```

## Quick Start

### 1. Configure AWS Credentials

```bash
aws configure
# Enter your AWS Access Key ID
# Enter your AWS Secret Access Key
# Default region: us-east-1
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Preview Infrastructure Changes

```bash
terraform plan
```

### 4. Deploy Infrastructure

```bash
terraform apply
```

Type `yes` when prompted to confirm deployment.

### 5. Access Web Server

After deployment completes, Terraform outputs the web server URL:
```
web_url = "http://[PUBLIC_IP]"
```

Visit this URL to verify the deployment.

### 6. Destroy Infrastructure (Cleanup)

```bash
terraform destroy
```

Type `yes` when prompted to confirm resource deletion.

## Configuration

Customize deployment by modifying `variables.tf` or using command-line variables:

```bash
terraform apply -var="instance_type=t3.small" -var="environment=staging"
```

### Available Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region for resources | `us-east-1` |
| `project_name` | Project name for tagging | `terraform-demo` |
| `environment` | Environment name | `dev` |
| `vpc_cidr` | VPC CIDR block | `10.0.0.0/16` |
| `public_subnet_cidr` | Public subnet CIDR | `10.0.1.0/24` |
| `instance_type` | EC2 instance type | `t2.micro` |

## Resources Created

- **1 VPC** with DNS support
- **1 Internet Gateway**
- **1 Public Subnet** in first availability zone
- **1 Route Table** with internet routing
- **1 Security Group** (ports 22, 80)
- **1 EC2 Instance** (t2.micro by default)

## Cost Considerations

Resources use AWS Free Tier eligible configurations where possible:
- **t2.micro** EC2 instance (750 hours/month free for first 12 months)
- Minimal data transfer for testing

**Remember to destroy resources after testing to avoid charges.**

## Key Features

**Modular Design** - Reusable variables and clean structure  
**Automated Provisioning** - Full infrastructure deployment in minutes  
**Security Best Practices** - Controlled ingress/egress rules  
**Production-Ready Patterns** - Tagging, naming conventions, documentation

## Learning Outcomes

- Infrastructure-as-Code principles with Terraform
- AWS VPC networking and security configuration
- EC2 instance provisioning and user data automation
- Terraform state management and resource dependencies

## Author

**Aniket Nandi**  
GitHub: [github.com/aniketnandi](https://github.com/aniketnandi)

---

*Built as part of cloud engineering portfolio demonstrating DevOps and infrastructure automation skills.*