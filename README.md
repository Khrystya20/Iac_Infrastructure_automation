# Iac Infrastructure Automation with Terraform

## Overview
This Terraform script automates the deployment of EC2 instances in AWS. It sets up two EC2 instances, configures a security group with necessary rules, and adds SSH keys for secure access.

## How it Works
1. **Creates two EC2 instances** in the specified AWS region.  
2. **Adds SSH keys** for access (specified in `variables.tf`).
3. **Configures a firewall** (`security group`):
-  Allows **SSH (port 22) from any IP**.
-  Allows **PostgreSQL access (ports 5432-5435) only between the servers**.
-  Allows **all outbound traffic**.

## Project Structure
```
├── ami.tf                 # Fetches the latest Ubuntu AMI
├── ec2.tf                 # Defines EC2 instances
├── security_group.tf      # Configures security group rules
├── providers.tf           # Defines Terraform provider and AWS region
└── variables.tf           # Defines variables for infrastructure configuration
```

## Prerequisites
Before you start, ensure you have:
- **[Terraform](https://developer.hashicorp.com/terraform/install?product_intent=terraform)** installed (`>=1.11`)
- **AWS CLI** installed and configured (`aws configure`)
- **AWS IAM permissions** to create EC2 instances and security groups
- **Public SSH keys** for secure access

## Setup and Deployment
1. **Initialize Terraform**
```sh
terraform init
```

2. **Plan deployment** (preview changes before applying)
```sh
terraform plan
```

3. **Apply configuration** (deploy resources)
```sh
terraform apply
```
 **Confirm by typing** `yes`

4. **Check deployed instances**
```sh
aws ec2 describe-instances --query 'Reservations[*].Instances[*].{ID:InstanceId,State:State.Name,PublicIP:PublicIpAddress}' --output table
```

5. **Connect via SSH**
```sh
ssh -i ~/.ssh/your_key.pem ubuntu@<public-ip>
```

## Destroy Infrastructure (Optional)
To remove all created resources, run:
```sh
terraform destroy
```
 **Confirm by typing** `yes`

## Configuration Details
### EC2 Instances (`ec2.tf`)
- Deploys `server_count` EC2 instances (default: 2)
- Uses the latest Ubuntu AMI
- SSH keys are added via `user_data`
- Security group assigned for controlled access

### Security Group (`security_group.tf`)
- Allows **SSH (port 22) from any IP**
- Allows **PostgreSQL access (ports 5432-5435) only between instances**
- Allows **all outbound traffic**

### Variables (`variables.tf`)
- `aws_region`: AWS region for deployment *(default: `eu-central-1`)*
- `server_count`: Number of EC2 instances *(default: 2)*
- `instance_type`: Type of instance *(default: `t2.micro`)*
- `public_ssh_keys`: List of SSH public keys for authentication

## Verification
After deployment, verify:
- **EC2 instances are running** (`aws ec2 describe-instances`)
- **Security group rules are correctly applied**
- **SSH access works as expected**

## Notes
- If instances fail to start due to missing SSH keys, ensure your public key is added correctly.
- Modify `variables.tf` for custom configurations.

