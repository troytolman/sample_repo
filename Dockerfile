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
COPY build.sh /app/scripts/build.sh
# Run build script
RUN apk add --no-cache python3
# RUN ls -l /app
RUN chmod +x /app/scripts/build.sh
# RUN ls -l /app
# RUN pwd
# RUN dos2unix build.sh
RUN .//app/scripts/build.sh

# Define the command to run your application so replace inside the brackets with the command you want to use 
CMD ["podman", "run", "--rm", "hello-world"] 
