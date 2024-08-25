# Kubernetes Deployment Guide
## Overview
Instructions for deploying an application using Kubernetes with Persistent Volume, Persistent Volume Claim, Deployment, Service, and Ingress.


#!/bin/bash

kubectl apply -f pv.yaml

kubectl apply -f pvc.yaml

kubectl apply -f deployment.yaml

kubectl apply -f service.yaml

kubectl apply -f ingress.yaml

## If using MiniKube

minikube service my-service

# Verification
## Check Pods:

kubectl get pods
Access Application:

