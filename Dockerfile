# Use an official Alpine Linux image with Podman installed
FROM alpine:latest

# Install Podman
RUN apk add --no-cache podman

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Expose any necessary ports
# Example: EXPOSE 8080

# Define the command to run your application so replace inside the brackets with the command you want to use 
CMD ["podman", "run", "--rm", "hello-world"] 
