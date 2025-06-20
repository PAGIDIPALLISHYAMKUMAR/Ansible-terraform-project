# Ansible-terraform-project
## Objective
Provision EC2 instances using Terraform and configure them using Ansible.

## Tools
- AWS
- Terraform
- Ansible
- Ubuntu 22.04

## Steps
1. Use Terraform to provision EC2 + Key Pair
2. Use Ansible to install Apache and deploy index.html
3. Access public IP to see the deployed page

## Commands
```bash
terraform apply
ansible-playbook -i inventory.ini playbook.yml -u ubuntu --private-key ~/.ssh/id_rsa
