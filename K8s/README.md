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

