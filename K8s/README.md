# Kubernetes Deployment Guide
## Overview
Instructions for deploying an application using Kubernetes with Persistent Volume, Persistent Volume Claim, Deployment, Service, and Ingress.


```bash
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


