# Employee Management System 

It's an Application to add and view Employee Details. This repository contains the necessary files and instructions to containerize our application and deploy it on an Amazon EC2 instance.

### Prerequisites
Before you begin, make sure you have the following prerequisites in place:

- An AWS account.
- Terraform CLI installed on your local machine, you can check it, [How to Install Guideline here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Clone the Git Repository

Clone this Git repository to your local machine using the following command:

```
git clone https://github.com/priya8goyal312/devops-fullstack-app.git
cd devops-fullstack-app
```

### Obtain AWS Account Access and Secret Key

To run Terraform for your AWS environment, you'll need a User which have a full acces to your account and its credentials.

1. In the AWS Console, navigate to the IAM > Users.
2. Click "Users" and give a name to the user, click on Next, "Attach policies directly" and give "AdministratorAccess" to the user and create it.
3. Go to your user's "Seurity Credentials" section and click on "Create access key" provide "Command line interface" as the use case, and create it.
4. Copy the Access and Secret Key or Download the .csv file.

### Initialize and Apply Terraform

Navigate to this directory
```
cd Devops/environments/
```

In provide.tf file paste your access and secret keys like this:
```
provider "aws" {
  region = "us-east-1" 
  access_key = "<ACCESS_KEY>"
  secret_key = "<SECRET_KEY>"
}
```
Next, in main.tf change values accordingly and run the following commands for apply:
First, initialize the modules:
```
terraform init
```
then, plan: 
```
terraform plan
```
and apply:
```
terraform apply
```
Using this, you have created VPC, RDS and EC2 Instance. Once it applies successfully, proceed to the Elastic IP and associate it with your instance.

### Containerize the Application

To containerize the application, follow these steps:

#### 1. Update Docker Compose File

Edit your docker-compose.yml file and update the ALLOWED_ORIGINS field with the instance IP address, and ensure that the necessary environment variables are set. Modify them according to your database configuration.

```
services:
  backend:
    environment:
      - ALLOWED_ORIGINS=http://<instance_ip>:8080
      - DB_HOST=<rds_endpoint>
      - DB_USER=<rds_username>
      - DB_PASSWORD=<rds_password>
      - DB_NAME=<rds_db_name>

```

#### 2.Configure Frontend
Create a .env file in your frontend folder and add the following:
```
REACT_APP_SERVER_URL=http://<instance_ip>:8080/employees
```
Replace <instance_ip> with the actual IP address of your EC2 instance.

### Deployment with GitHub Actions Pipeline

Navigate to your repository settings and set the following secrets:
```
INSTANCE_IP: IP address of your EC2 instance.
HOSTNAME: Hostname of your EC2 instance.
INSTANCE_PRIVATE_KEY: Your SSH private key for accessing the EC2 instance.
SSH_KEY: Your id_rda key for authentication. 
```

Push your code to GitHub. When you push to the main branch, your pipeline will trigger and run. Once it's executed, it will deploy your application to an EC2 instance."

Once the deployment is successful, access your application at:
```
http://<instance_ip>:3000  for the frontend.
http://<instance_ip>:8080/employees  to check stored data.
```
Replace <instance_ip> with the actual IP address of your EC2 instance.





