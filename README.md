# Project 3 – AWS ALB + ASG with Terraform

## Overview
Production AWS infrastructure with load balancing and auto-scaling using Terraform.

## Architecture
Internet → ALB → Target Group → ASG (min=1, max=2) → EC2 (Docker + Nginx)

## Key Features
- S3 + DynamoDB remote state with locking
- Launch Template for immutable infrastructure
- Auto Scaling Group with health checks
- ALB with proper security group separation
- Self-healing systems

## Quick Start
```bash
terraform init
terraform plan
terraform apply
```

## Technologies
Terraform, AWS (ALB, ASG, EC2, S3, DynamoDB)