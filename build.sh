#!/bin/bash

# Function to display error messages and return non-zero exit code
error_exit() {
    echo "$1" >&2
    exit 1
}


IMAGE_NAME="scanner-app-container"
DOCKERFILE_PATH="./Dockerfile"

# Build the container image using Podman
podman build -t $IMAGE_NAME -f $DOCKERFILE_PATH .



    

# Exit with success code
exit 0
