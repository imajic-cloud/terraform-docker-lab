# Terraform AWS ALB + Docker Nginx

This project provisions a simple AWS infrastructure using **Terraform**.

It deploys an **Application Load Balancer (ALB)** that routes traffic to **EC2 instances running Docker with an Nginx container**.

The infrastructure demonstrates a common DevOps architecture using **Infrastructure as Code (IaC)**.

---

## Architecture

Internet → Application Load Balancer → Target Group → EC2 → Docker → Nginx

The ALB distributes incoming HTTP traffic to EC2 instances running an Nginx container.

---

## Technologies Used

* Terraform
* AWS EC2
* AWS Application Load Balancer (ALB)
* AWS Target Groups
* AWS Security Groups
* AWS Auto Scaling
* Docker
* Nginx
* Bash (User Data script)

---

## Prerequisites

Before deploying this infrastructure, ensure you have:

* AWS account with configured credentials
* Terraform installed (v1.3 or newer)
* AWS CLI configured (`aws configure`)
* SSH key pair for EC2 access

---

## Resources Created

This Terraform project provisions the following AWS resources:

* Application Load Balancer (ALB)
* Target Group with health checks on port 80
* Auto Scaling Group with EC2 instances
* Launch Template
* Security Groups (ports 80 and 22)
* IAM roles for EC2 instances
* EC2 instances running Docker and Nginx

---

## Deployment

Initialize Terraform:

```bash
terraform init
```

Review the infrastructure plan:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

Terraform will create all AWS resources and automatically configure the EC2 instances using the **user_data script**.

---

## User Data Script

The EC2 instance automatically installs Docker and runs an Nginx container:

```bash
#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user
docker pull nginx
docker run -d --name nginx-container --restart always -p 80:80 nginx
```

This ensures that every EC2 instance automatically runs a web server container when launched.

---

## Accessing the Application

After deployment completes (wait **3–5 minutes** for the ALB health checks):

### Get the Load Balancer DNS name

```bash
terraform output alb_dns_name
```

Example output:

```
docker-lab-alb-1259050614.us-east-1.elb.amazonaws.com
```

### Open the application

```
http://<alb_dns_name>
```

You should see the **Nginx welcome page**.

---

## ⚠️ Cost Warning

This infrastructure creates real AWS resources and may incur charges
(typically **~$1–2 per day** depending on usage).

Remember to destroy the infrastructure when finished:

```bash
terraform destroy
```

---

## Project Structure

```
03-aws-alb-asg-terraform
│
├── main.tf
├── variables.tf
├── outputs.tf
├── user_data.sh
├── modules/
│   ├── ec2/
│   └── security-group/
├── .gitignore
└── README.md
```
## Key Learnings

This project demonstrates:
- Infrastructure as Code with Terraform
- AWS load balancing and auto-scaling
- Containerized application deployment
- Security group configuration
- Automated infrastructure provisioning

## Troubleshooting

**If instances show as unhealthy:**
- Wait 3-5 minutes for Docker installation to complete
- Check security groups allow port 80
- Verify user_data script executed successfully

**If ALB URL doesn't load:**
- Ensure instances are healthy in target group
- Check that subnets have internet gateway attached
- Verify security groups allow inbound HTTP traffic
---

## Author

Ivan Majic
DevOps Engineer
