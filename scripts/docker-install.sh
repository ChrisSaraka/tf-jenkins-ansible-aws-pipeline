#!/bin/bash

sudo yum update -y

sudo yum install -y docker

sudo service docker start

sudo usermod -a -G docker ec2-user

docker run --rm -d -p 8080:8080 -p 50000:50000 jenkins/jenkins:2.239