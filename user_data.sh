#!/bin/bash
yum update -y

# Install Docker

amazon-linux-extras install docker -y

# Start Docker service

systemctl start docker
systemctl enable docker

# Allow ec2-user to run Docker

usermod -aG docker ec2-user

# Pull nginx image

docker pull nginx

# Run nginx container on port 80

docker run -d --name nginx-container --restart always -p 80:80 nginx
