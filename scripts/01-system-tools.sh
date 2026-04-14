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
    python3-pip \
    python3-venv \
    pipx

echo "=== System tools installation complete ==="
