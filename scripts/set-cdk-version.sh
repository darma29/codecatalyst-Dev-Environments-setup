#!/bin/bash

# Define colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'
# Get the script file name
SCRIPT_NAME=$(basename "${BASH_SOURCE[0]}")
# Display the script file name
echo -e "\n${CYAN}Executing script: $SCRIPT_NAME${NO_COLOR}\n"

nvm use 18.17.1
sudo npm uninstall -g cdk
nvm use 20.6.1
sudo npm i -g cdk@2.124.0
