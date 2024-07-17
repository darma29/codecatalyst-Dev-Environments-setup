#!/bin/bash

# Define colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'
# Get the script file name
SCRIPT_NAME=$(basename "${BASH_SOURCE[0]}")
# Display the script file name
echo -e "\n${CYAN}Executing script: $SCRIPT_NAME${NO_COLOR}\n"

# Install rye (document: https://rye.astral.sh/guide/installation/)
curl -sSf https://rye.astral.sh/get | RYE_VERSION="latest" RYE_INSTALL_OPTION="--yes" bash