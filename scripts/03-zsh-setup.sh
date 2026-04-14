#!/bin/bash
set -e

echo "=== Setting up Zsh and Oh My Zsh ==="

# Check if Oh My Zsh is already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install custom plugins (e.g., zsh-autosuggestions, zsh-syntax-highlighting)
echo "Installing custom plugins..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
mkdir -p "$ZSH_CUSTOM/plugins"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Setup symlinks for configs
echo "Linking configuration files..."
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGS_DIR="$(cd "$SCRIPTS_DIR/../configs" && pwd)"

# Backup existing configs if they are not symlinks
FILES=(".zshrc" ".gitconfig" ".p10k.zsh")
for file in "${FILES[@]}"; do
    if [ -f "$CONFIGS_DIR/$file" ]; then
        if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
            echo "Backing up existing $HOME/$file to $HOME/$file.bak"
            mv "$HOME/$file" "$HOME/$file.bak"
        fi
        ln -sf "$CONFIGS_DIR/$file" "$HOME/$file"
        echo "Linked $HOME/$file"
    fi
done

echo "=== Zsh setup complete. Please restart your shell or run 'zsh' ==="
