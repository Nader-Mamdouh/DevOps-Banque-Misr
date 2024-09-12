# Deployment on AWS EKS

This guide explains how to deploy an application on AWS Elastic Kubernetes Service (EKS) using Kubernetes. It covers the creation of a namespace, setup of persistent storage, initialization of data, deployment of the application, and exposure of the application via a LoadBalancer Service and an Ingress.

## 1. Namespace Creation

To logically group all related Kubernetes resources, we first create a namespace. Namespaces help in organizing and isolating different components of the application.

### Steps:
1. Define a namespace in your Kubernetes configuration.
2. Apply the configuration to create the namespace.

## 2. Persistent Storage Setup

For managing application storage, we set up a Persistent Volume (PV) and a Persistent Volume Claim (PVC). The PV provides a storage resource in the cluster, while the PVC allows the application to request and use that storage.

### Definitions:
- **Persistent Volume (PV)**: Represents a piece of storage available for use.
- **Persistent Volume Claim (PVC)**: Requests storage from the available PV.

### Steps:
1. Define a Persistent Volume in your configuration.
2. Define a Persistent Volume Claim that requests storage from the PV.
3. Apply the configurations to create the PV and PVC.

## 3. Data Initialization with a Kubernetes Job

We use a Kubernetes Job to copy initial data into the persistent storage. This job ensures that required data is available in the persistent volume before the application starts.

### Steps:
1. Define a Job in your Kubernetes configuration that copies the data.
2. Apply the configuration to run the job and initialize the data.

## 4. Application Deployment

Deploy the application using a Kubernetes Deployment. The Deployment manages the application's lifecycle, including scaling, updating, and ensuring the desired number of replicas are running. It is configured to use the Persistent Volume Claim to access the persistent storage.

### Steps:
1. Define a Deployment in your configuration, specifying the number of replicas and container details.
2. Apply the configuration to deploy the application.

## 5. Exposing the Application

To make the application accessible, create a Kubernetes Service of type LoadBalancer. This Service provisions a cloud load balancer to route external traffic to the application's pods, providing public access.

### Steps:
1. Define a Service of type LoadBalancer in your configuration.
2. Apply the configuration to create the Service.

## 6. Routing Traffic with Ingress

Configure an Ingress resource to manage external access to the application. The Ingress allows you to define rules for routing HTTP and HTTPS traffic to the appropriate Service within the cluster. It provides a single point of access with flexible routing options.

### Steps:
1. Define an Ingress resource in your configuration.
2. Apply the configuration to set up the Ingress rules.

## Summary

This guide provides a comprehensive approach to deploying an application on AWS EKS using Kubernetes. It includes setting up namespaces, persistent storage, initializing data, deploying the application, and exposing it through a LoadBalancer and Ingress. Follow these steps to ensure your application is well-organized, scalable, and accessible.

For further details or troubleshooting, refer to the official [Kubernetes documentation](https://kubernetes.io/docs/home/) or the [AWS EKS documentation](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html).































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
