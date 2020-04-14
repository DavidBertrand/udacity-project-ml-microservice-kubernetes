#!/usr/bin/env bash


# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="bertrand282/ml-microservice"

# Step 2
# Run the Docker Hub container with kubernetes
podname="ml-microservice-pod"
kubectl run $podname --image=$dockerpath --port=80 --generator=run-pod/v1

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $podname 8000:80
