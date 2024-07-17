#!/bin/bash

# Define colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'

echo -e "\n${GREEN}Run setup scripts${NO_COLOR}\n"
find /projects/codecatalyst-Dev-Environments-setup/scripts -type f -name '*.sh' -exec chmod +x {} \; -exec {} \;
