FROM ubuntu:latest

# Update the package list and install dependencies
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  python3-dev \
  git

# Verify Python and pip installation
RUN python3 --version
RUN pip3 --version

# Install PyYAML with logs for debugging
RUN pip3 install --no-cache-dir PyYAML

# Copy the Python script and entrypoint script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
