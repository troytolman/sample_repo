# Use an official Alpine Linux image with Podman installed
FROM ubuntu:latest

# Install Podman
RUN apt-get update && apt-get install -y podman python3-tk

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Expose any necessary ports
# Example: EXPOSE 8080

RUN chmod +x build.sh

# RUN pwd
# RUN dos2unix build.sh
RUN build.sh

# Define the command to run your application so replace inside the brackets with the command you want to use 
CMD ["podman", "run", "--rm", "hello-world"] 
