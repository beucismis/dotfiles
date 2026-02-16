#!/bin/bash

NC='\033[0m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'

echo -e "${BLUE}Starting GitHub SSH configuration...${NC}"
read -p "Enter your GitHub email address: " email

if [ -f ~/.ssh/id_ed25519 ]; then
    echo -e "${GREEN}Existing SSH key found, skipping generation.${NC}"
else
    echo -e "${BLUE}Generating new SSH key...${NC}"
    ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N ""
fi

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo -e "${GREEN}COPY THE KEY BELOW AND ADD IT TO GITHUB:${NC}"
cat ~/.ssh/id_ed25519.pub

echo -e "${BLUE}Test it with: ${NC}ssh -T git@github.com"
