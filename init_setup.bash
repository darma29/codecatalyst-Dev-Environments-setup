#!/bin/bash

# Define colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'

# Enable debug mode
# set -x

# Install tree 
# sudo dnf -y install tree

# Install the_silver_searcher
# sudo dnf -y groupinstall "Development Tools" && \
# sudo dnf -y install pcre-devel xz-devel zlib-devel && \
# cd /usr/local/src && \
# [ -d the_silver_searcher ] || sudo git clone https://github.com/ggreer/the_silver_searcher.git && \
# cd the_silver_searcher/ && \
# sudo ./build.sh && \
# sudo make install

# Install lazygit
# cd /tmp && \
# [ -d lazygit ] || git clone https://github.com/jesseduffield/lazygit.git && \
# cd lazygit && \
# go install

# Update .bashrc
echo -e "${CYAN}Updating .bashrc...${NO_COLOR}"
echo '
### Custom script for codecatalyst ###
# git completion
source /usr/share/doc/git/contrib/completion/git-completion.bash
# Check if starship is installed
if ! command -v starship &> /dev/null; then
  # Install starship
  curl -sS https://starship.rs/install.sh | sh -s -- -y > /dev/null
fi
# Initialize starship
eval "$(starship init bash)"
# Install lazygit : go install github.com/jesseduffield/lazygit@latest
go_path="~/go/bin"
if [[ ":$PATH:" != *":$go_path:"* ]]; then
    export PATH=$PATH:$go_path # Check if the path is not already in the PATH
fi
# Add Rye path 
source "$HOME/.rye/env"
' >> ~/.bashrc

# Overwrite devfile.yaml
echo -e "${CYAN}Copying devfile.yaml to the current directory...${NO_COLOR}"
cp /projects/codecatalyst-devenv-setup/devfile.yaml /projects/devfile.yaml

# Source the updated .bashrc
echo -e "${CYAN}Sourcing the updated .bashrc...${NO_COLOR}"
source ~/.bashrc

# Display completion message
echo -e "\n${GREEN}Environment setup completed!${NO_COLOR}\n"
cd /projects 

# Disable debug mode
# set +x
