#!/bin/bash

# Define colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'
# Get the script file name
SCRIPT_NAME=$(basename "${BASH_SOURCE[0]}")
# Display the script file name
echo -e "\n${CYAN}Executing script: $SCRIPT_NAME${NO_COLOR}\n"

# Install lazygit
go install github.com/jesseduffield/lazygit@latest

# cd /tmp && \
# [ -d lazygit ] || git clone https://github.com/jesseduffield/lazygit.git && \
# cd lazygit && \
# go install