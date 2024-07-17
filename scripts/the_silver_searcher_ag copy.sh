#!/bin/bash

# Define colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'
# Get the script file name
SCRIPT_NAME=$(basename "${BASH_SOURCE[0]}")
# Display the script file name
echo -e "\n${CYAN}Executing script: $SCRIPT_NAME${NO_COLOR}\n"

# Install the_silver_searcher
sudo dnf -y groupinstall "Development Tools" && \
sudo dnf -y install pcre-devel xz-devel zlib-devel && \
cd /usr/local/src && \
[ -d the_silver_searcher ] || sudo git clone https://github.com/ggreer/the_silver_searcher.git && \
cd the_silver_searcher/ && \
sudo ./build.sh && \
sudo make install