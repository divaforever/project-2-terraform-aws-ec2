# Project 2 - Terraform + AWS EC2 + Security Group + User Data

## Objective

Provision AWS infrastructure using Terraform.

This project demonstrates Infrastructure as Code (IaC) by creating AWS resources automatically using Terraform.

---

## Technologies Used

* Terraform
* AWS EC2
* AWS Security Group
* AWS IAM User
* Ubuntu Linux
* Nginx

---

## Architecture

Terraform → AWS

Creates:

* Security Group
* EC2 Instance
* User Data Script
* Nginx Web Server

---

## Resources Created

### Security Group

Inbound Rules:

* SSH (22)
* HTTP (80)

Outbound Rules:

* All Traffic

### EC2 Instance

* Ubuntu Server
* t2.micro
* Key Pair Authentication

### User Data

Automatically:

* Updates packages
* Installs Nginx
* Starts Nginx service

---

## Terraform Commands Used

Initialize:

terraform init

Validate:

terraform validate

Plan:

terraform plan

Create Resources:

terraform apply

Destroy Resources:

terraform destroy

---

## Verification

Terraform State:

terraform state list

Public IP:

terraform state show aws_instance.webserver

Website:

http://PUBLIC-IP

---

## Screenshots

### Terraform Plan

screenshots/terraform-plan.png

### Terraform Apply

screenshots/terraform-apply.png

### Security Group

screenshots/security-group.png

### EC2 Running

screenshots/ec2-running.png

### Website Running

screenshots/website-running.png

### Terraform Destroy

screenshots/terraform-destroy.png

---

## Key Learnings

* Infrastructure as Code
* Terraform Workflow
* AWS Provider Configuration
* Security Groups
* EC2 Provisioning
* User Data Automation
* Terraform State Management
* Resource Creation and Destruction
