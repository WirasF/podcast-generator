FROM ubuntu:latest

# Update the package list and install dependencies
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git

# Install PyYAML with the flag to bypass the restriction
RUN pip3 install --no-cache-dir PyYAML --break-system-packages

# Copy the Python script and entrypoint script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
