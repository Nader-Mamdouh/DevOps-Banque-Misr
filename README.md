# Software_Library

The "Boom Library Management" project is a Django-based system designed to streamline the process of managing library resources. It allows users to update the borrowing status of books, search and filter through the library's collection, and provides admin features like adding, updating, and deleting books. The system is user-friendly, ensuring that both regular users and administrators can efficiently manage and access library resources.

## Getting Started for Linux

### Clone the Repository

```bash
git clone https://github.com/Macarious-GK/DevOps.git
cd App
python3 -m venv venv
```
### Activate virtual environment using bash and install dependences

```bash
source venv/bin/activate 
pip install -r requirements.txt 
python manage.py runserver
python3 manage.py test
```

###  The Webapp will run on Localhost Port: 8000
# Building and Running the Docker Image

## Build the Docker Image

To build the Docker image using either of the Dockerfiles, run the following commands:

### Using `Dockerfile`

```bash
docker build -t my-python-app -f Dockerfile .
```
### Using `Dockerfile_copy(multi-stage)`
```bash
docker build -t my-python-app -f Dockerfile_copy .
```
### Run the Container
To run the container and expose the application on port 8000, use the following command:
```bash
docker run -p 8000:8000 my-python-app
```
This will make the application accessible at http://localhost:8000.
# Kubernetes Deployment Guide
## Overview
Instructions for deploying an application using Kubernetes with Persistent Volume, Persistent Volume Claim, Deployment, Service, and Ingress.

## Prerequisites
Before proceeding, ensure that:
-   You have a Kubernetes cluster running (e.g., Minikube, EKS, GKE, etc.).
-   awscli, ekscli and kubectl command-line tool is installed and configured to communicate with your cluster.

## Automating the process
-  Make the script executable by running
-  Execute the script by running:
```bash
chmod +x K8s_deploy_and_check.sh
./K8s_deploy_and_check.sh
```
## Or Manually doing the process
### If using Minikube start with:
```bash
minikube start && minikube addons enable ingress
```

### After Creating or Connecting to the Cluster
```console

kubectl apply -f namespace.yaml

kubectl apply -f pv.yaml

kubectl apply -f pvc.yaml

kubectl apply -f job.yaml

kubectl apply -f service.yaml

kubectl apply -f ingress.yaml

kubectl apply -f deployment.yaml

```

# Verification
## Check Pods:

kubectl get pods -n your-namespace

kubectl get events -n your-namespace




### under Testing
kubectl get secrets
kubectl describe secret terminal-creds
kubectl get secret terminal-creds -o jsonpath='{.data.username}'| base64 --decode
kubectl get secret terminal-creds -o jsonpath='{.data.password}'| base64 --decode
kubectl create sa terminal-user
kubectl create sa terminal-admin

kubectl auth can-i get secret/terminal-creds --as=system:serviceaccount:default:terminal-user
kubectl auth can-i get secret/terminal-creds --as=system:serviceaccount:default:terminal-admin
# Terraform Infrastructure for Book Library Management

In this section, we utilized Terraform to manage and provision the infrastructure on AWS, ensuring a scalable and consistent setup for the "Book Library Management" application. The infrastructure is designed to be modular and maintainable, using separate modules for different components such as VPC, security groups, and EKS clusters. Additionally, Terraform is configured to store its state files on an S3 bucket, centralizing resource management and enhancing collaboration.

## Prerequisites
Before creating Infrastructure as Code (IaC), ensure you have created an IAM Role on AWS and obtained the necessary credentials.

## Terraform Modules

### VPC Module
- **Purpose**: Defines and provisions the Virtual Private Cloud (VPC) and associated networking components, such as subnets and route tables.
- **Module Path**: `./VPC_Module`

### SecurityGroup Module
- **Purpose**: Manages security groups, specifying rules for inbound and outbound traffic to secure the infrastructure.
- **Module Path**: `./SecurityGroup_Module`

### Node Group Module
- **Purpose**: Configures and manages the node groups in the Kubernetes cluster.
- **Module Path**: `./NodeGroup_Module`

### EKS Module
- **Purpose**: Provisions the Amazon EKS (Elastic Kubernetes Service) cluster, enabling container orchestration and management.
- **Module Path**: `./EKS_Module`

### EC2 Module (Bastion Server)
- **Purpose**: Deploys an EC2 instance as a bastion server for secure access and management of the EKS cluster.
- **Module Path**: `./EC2_Module`

## Configure Terraform Backend

- **Backend Configuration**: Terraform state files are stored in an S3 bucket to centralize the management of infrastructure state. This setup facilitates better collaboration and consistency across different environments by providing a shared and reliable state storage solution.

## How to Use

1. **Setup IAM Role**: Create an IAM Role on AWS and configure it with the necessary permissions.
2. **Configure Credentials**: Use the IAM credentials to authenticate Terraform.
3. **Initialize Terraform**: 
    ```bash
    terraform init
    ```
4. **Apply Configuration**: 
    ```bash
    terraform apply
    ```
5. **Destroy Configuration**: 
    ```bash
    terraform destroy
    ```
6. **Manage Infrastructure**: Use the Bastion Server to SSH into the EKS cluster for management.

## Summary

By leveraging Terraform’s modular approach and centralized state management, the infrastructure setup for the application is both robust and adaptable. This setup supports efficient deployment and management of resources, ensuring a scalable environment for the Book Library Management application.
# Jenkins Pipelines

This repository contains Jenkins pipelines for different parts of the application and infrastructure management process. The pipelines utilize a shared library from the following repository: [Jenkins Shared Library](https://github.com/Macarious-GK/Jenkins-Shared-Library.git).

## Folder Structure

The Jenkins folder consists of the following pipelines:

1. **App_Pipeline**: Pipeline responsible for building, testing, and deploying the application.
2. **RRemove_Deployment**: Pipeline responsible for tearing down or removing the deployment from the environment.
3. **Infra_Pipeline**: It is responsible for both **applying** and **destroying** infrastructure resources by using **Build with Parameters** action: (apply or destroy)

## Jenkins Shared Library

The pipelines in this repository make use of a shared library to promote reusable and modular pipeline steps. The shared library is hosted in the following GitHub repository: [Jenkins Shared Library](https://github.com/Macarious-GK/Jenkins-Shared-Library.git).

To use the shared library in your Jenkins pipeline, add the following configuration to your `Jenkinsfile`:

```groovy
@Library('Jenkins-Shared-Library') _
// Pipeline Code
```

## Credential Management
- **Credentials Storage**: Use Jenkins’ credentials management to securely store sensitive information like API keys and passwords.
- **Environment Variables**: Access credentials via environment variables configured in Jenkins.

## Security Authorization
- **Mixed Security Authorization**: Segment access permissions based on roles and responsibilities.
- **Least Privilege Principle**: Ensure users and services have only the permissions needed for their tasks.

## Plugin Installation

### Required Plugins
1. **AWS Credentials Plugin**: For managing AWS credentials in Jenkins.
2. **GitHub Plugin**: For integrating Jenkins with GitHub repositories.

#### Install Plugins
1. Go to **Manage Jenkins** -> **Manage Plugins**.
2. Under the **Available** tab, search for **AWS Credentials** and **GitHub**.
3. Select the plugins and click **Install without Restart**.


## How to Run the Pipelines
1. Configure Jenkins Shared Library under **Manage Jenkins** -> **Configure System** -> **Global Pipeline Libraries**.
2. Update your `Jenkinsfile` to use the shared library.
3. Trigger pipelines through Jenkins UI or set automated SCM-based triggers.
