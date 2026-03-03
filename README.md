# 🚀 Terraform AWS Docker Lab

## 📌 Overview

This project provisions production-style infrastructure on AWS using Terraform.

It deploys a Dockerized Nginx application behind an Application Load Balancer with Auto Scaling support.

---

## 🏗 Architecture

Internet  
   ↓  
Application Load Balancer  
   ↓  
Target Group (Health Checks)  
   ↓  
Auto Scaling Group (min=1, max=2)  
   ↓  
EC2 Instance (Docker + Nginx)

---

## ⚙️ Features Implemented

- Remote backend (S3 + DynamoDB state locking)
- Modular Terraform structure
- Launch Template for immutable infrastructure
- Auto Scaling Group (self-healing)
- Application Load Balancer
- Target Group health checks
- Proper security group referencing (ALB → EC2)
- IAM Instance Profile for EC2
- Dockerized Nginx deployment via user_data
- Infrastructure destroy/recreate workflow

---

## 🧠 Key Concepts Practiced

- Immutable infrastructure
- Launch Templates vs aws_instance
- ASG behavior & instance replacement
- ALB health check debugging
- Security group referencing
- Terraform state management
- Cost-aware infrastructure lifecycle

---

## 🛠 Commands Used

```bash
terraform init
terraform plan
terraform apply
terraform destroy