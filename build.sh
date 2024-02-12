#!/bin/bash

# Function to display error messages and return non-zero exit code
error_exit() {
    echo "$1" >&2
    exit 1
}

# Check if Python 3 is installed
if ! command python --version && ! command python3 --version; then
    error_exit "Error: Python 3 is not installed."
fi

# Install dependencies if needed


# Run the Python GUI application
if command python --version; 
then
    python gui.py || error_exit "Error: Failed to run the application."
elif command python3 --version;
then
    python3 gui.py || error_exit "Error: Failed to run the application."
fi
    

# Exit with success code
exit 0
