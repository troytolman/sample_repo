# Use an official Ubuntu image
FROM ubuntu:latest

# Install Podman, Python 3, Tkinter, ca-certificates, and other necessary packages for rootless networking
RUN apt-get update && apt-get install -y podman python3 python3-tk ca-certificates iptables iproute2

# Set up rootless networking environment
RUN mkdir -p /etc/containers && \
    echo 'usernetes' > /etc/containers/nodocker && \
    echo 'slirp4netns' > /etc/containers/slirp4netns && \
    echo 'portcgroup' > /etc/containers/portcgroup

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Copy the build script
COPY build.sh /app/scripts/build.sh

# Set execute permissions for the build script
RUN chmod +x /app/scripts/build.sh

# Run the build script
RUN /app/scripts/build.sh

# Define the command to run your application
CMD ["podman", "run", "--rm", "hello-world"]
