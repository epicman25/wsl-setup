#!/bin/bash
set -e

echo "=== Bootstrapping System Tools with Nala ==="

# Ensure apt is updated and nala is installed
sudo apt update
sudo apt install -y nala

# Use nala to install common tools
echo "Installing common utilities..."
sudo nala install -y \
    build-essential \
    curl \
    git \
    gh \
    zsh \
    bat \
    ripgrep \
    fd-find \
    htop \
    btop \
    httpie \
    redis-tools \
    direnv \
    jq \
    fzf \
    python3-pip \
    python3-venv \
    pipx

# Fix common Docker completion bug in WSL
if [ -L /usr/share/zsh/vendor-completions/_docker ] && [ ! -e /usr/share/zsh/vendor-completions/_docker ]; then
    echo "Removing broken Docker completion symlink..."
    sudo rm /usr/share/zsh/vendor-completions/_docker
fi

# Install NVM
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi

echo "=== System tools installation complete ==="
