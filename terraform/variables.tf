variable "server_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2
}

variable "aws_region" {
  description = "AWS region where instances will be created"
  type        = string
  default = "eu-central-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default = "t2.micro"
}

variable "public_ssh_keys" {
  description = "List of public SSH keys allowed for SSH access"
  type        = list(string)
  default = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDc2/jifcLzbJccv9kPqfrhGuG1Yf+otn/iXneeIwtLsro7HiTxsjrQIrpM5yFh1CaVYb5Keut0lKyVvzH41H0hSjvkkO0VRFZ+bBNXxl51I/4E5wc2czcf0WWT/izW08e9BTvd6az+g6/3c9OY0cNuXV2GKhuscaXvvpYceDTEZ2GluS80xTHbX27PZx8zNaPgmlA4rWOjkYMZPNsDB//1yGqmCMDdkgijrNixcEcXhuWyJitQJs47ncUDDo5Wj1El3GPYz3md7A1lPemQA7wBMCIEc+aqUChs1M1k/4mZiFXXG6BlybKrVDJ1zAzcmOaXdoGdzylNyNledsDnWasiQGHxn4raxJ2UIiB62Oa/pmTGgtgkZBKuugn5EgE37jN0OYLLrfcaw/iI9T7RV+bxWimdIpIM4RpsUIAEIbx/o84BKga6HRa4UwJIbee7rZBUNFupp0SQ8d3BqosvZhXJN2crArFKyz8DFuu0ZFieG+JMy1eJ0Ef/bsj2rBqP77e/rUBej4LecQ/Kaj2zQgBxewyLJn4oJv5xV1+6vqFFMgb+D6ipuQt7/Za+oGmrSlgvcNs3QqGj6oWIUmbBhzTwm8HLNeUrH5l3zfHpV7tinXeJDPQtJ6pQB8XLSusEsU52GTyPeBWYq3Ph+6pYfyXpYWm4PfVXMTTfIoi/AiVzGQ== kh.boiko@ukma.edu.ua",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOkAhvfRyUvgsUwENIds1a/4OvuHQgLki8K1EzPltl5M i.ilin@iilin-pro14.local"
  ]
}
