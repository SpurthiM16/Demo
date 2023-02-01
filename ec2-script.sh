#!/bin/bash

# check if AWS CLI is installed
if ! command -v aws &> /dev/null
then
  echo "AWS CLI is not installed. Please install it and run the script again."
  exit 1
fi

# Define VPC ID and Subnet ID
echo "Defining VPC and Subnet..."
VPC_ID=vpc-0d1aa1818fda05f11
SUBNET_ID=subnet-0da722220074863a9

# create EC2 instance
echo "Creating EC2 instance..."
aws ec2 run-instances --image-id ami-048c24e329a4443a4 --count 1 --instance-type t2.micro --key-name Keypair1 --subnet-id $SUBNET_ID --security-group-ids sg-01d347b9e868c1457

# Get the instance ID of the newly created instance
echo "Getting instance ID..."
INSTANCE_ID=$(aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].InstanceId" --output text)
echo "Instance ID: $INSTANCE_ID"

# start EC2 instance
echo "Starting EC2 instance..."
aws ec2 start-instances --instance-ids $INSTANCE_ID

# stop EC2 instance
read -p "Press [Enter] key to stop the instance..."
echo "Stopping EC2 instance..."
aws ec2 stop-instances --instance-ids $INSTANCE_ID
