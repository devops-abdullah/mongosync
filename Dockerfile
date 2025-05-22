# Use Alpine as base
FROM alpine:latest

# Add labels
LABEL maintainer="abdullah.itdeft@gmail.com"
LABEL description="MongoSync container based on Alpine"

# Install required packages
RUN apk update && apk add --no-cache \
    mongodb-tools \
    bash \
    curl \
    ca-certificates \
    gcompat \
    && rm -rf /var/cache/apk/*

# Copy your mongosync binary/script to container
## Package: https://fastdl.mongodb.org/tools/mongosync/mongosync-ubuntu2404-x86_64-1.13.1.tgz
COPY bin/mongosync /usr/local/bin

# Make sure it's executable
RUN chmod +x /usr/local/bin/mongosync

# Set working directory
WORKDIR /data

EXPOSE 27182/tcp

# Default command
CMD ["mongosync", "--help"]
