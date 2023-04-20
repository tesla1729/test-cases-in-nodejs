FROM ubuntu:latest

# Create a directory and give any user read/write access to it
RUN mkdir /app && \
    chmod -R 777 /app

# Set the working directory to the newly created directory
WORKDIR /app

# Copy your application files to the working directory
COPY . /app

# The rest of your Dockerfile instructions...
