# Use an official Ubuntu image
FROM ubuntu:latest

ENV TZ=UTC

# Install Podman, Python 3, Tkinter, ca-certificates, and other necessary packages for rootless networking
RUN apt-get update && apt-get install -y podman python3 python3-tk python3-pip 

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Copy the build script
#COPY build.sh /app/scripts/build.sh

# Set execute permissions for the build script
RUN chmod +x /app/build.sh

# Run the build script
RUN /app/build.sh

# Define the command to run your application
CMD ["podman", "run", "--rm", "scanner-app-container"]
