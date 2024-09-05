# Kubernetes Deployment Guide
## Overview
Instructions for deploying an application using Kubernetes with Persistent Volume, Persistent Volume Claim, Deployment, Service, and Ingress.

## Prerequisites
Before proceeding, ensure that:
-   You have a Kubernetes cluster running (e.g., Minikube, EKS, GKE, etc.).
-   kubectl command-line tool is installed and configured to communicate with your cluster.


```console

kubectl apply -f namespace.yaml

kubectl apply -f pv.yaml

kubectl apply -f pvc.yaml

kubectl apply -f job.yaml

kubectl apply -f service.yaml

kubectl apply -f ingress.yaml

kubectl apply -f deployment.yaml

```


## If using Minikube Enable Ingress

minikube addons enable ingress

# Verification
## Check Pods:

kubectl get pods


