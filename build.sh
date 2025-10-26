#!/bin/bash

# Exit immediately if any command fails
set -e

# Variables
IMAGE_NAME="react-static-app"
TAG="latest"

echo "Building Docker image: $IMAGE_NAME:$TAG"

# Build the Docker image
docker build -t $IMAGE_NAME:$TAG .

echo "Docker image $IMAGE_NAME:$TAG built successfully!"

