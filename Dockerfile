# Use an official Ubuntu image
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install Podman, Python 3, Tkinter, ca-certificates, and other necessary packages for rootless networking
RUN apt-get update && apt-get install -y podman python3 python3-tk && pip3 install pylint

RUN pylint app/gui.py

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY . /app

run pylint gui.py

# Define the command to run your application
CMD ["podman", "run", "--rm", "scanner-app-container"]
