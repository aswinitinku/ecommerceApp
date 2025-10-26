#!/bin/bash
# Exit immediately if any command fails
set -e

# Variables
IMAGE_NAME="react-static-app"
TAG="latest"
CONTAINER_NAME="react-app-container"
PORT=80

echo "Stopping and removing old container if it exists..."
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

echo "Deploying new container from image $IMAGE_NAME:$TAG..."
docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME:$TAG

echo "Application deployed successfully on http://localhost:$PORT"

