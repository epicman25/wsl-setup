#!/bin/bash
set -e

# Copy active configuration files into this repository
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGS_DIR="$(cd "$SCRIPTS_DIR/../configs" && pwd)"

FILES=(".zshrc" ".gitconfig" ".p10k.zsh")

echo "=== Backing up current configs into wsl-setup repo ==="

for file in "${FILES[@]}"; do
    if [ -f "$HOME/$file" ]; then
        cp "$HOME/$file" "$CONFIGS_DIR/"
        echo "Copied $HOME/$file to $CONFIGS_DIR/$file"
    fi
done

echo "=== Backup complete ==="
