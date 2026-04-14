#!/bin/bash
set -e

EMAIL="tejeshwarreddy25@gmail.com"

echo "=== SSH Key Setup ==="

if [ -f "$HOME/.ssh/id_ed25519" ]; then
    echo "SSH Key already exists at ~/.ssh/id_ed25519"
else
    echo "Generating new SSH key for $EMAIL..."
    ssh-keygen -t ed25519 -C "$EMAIL" -f "$HOME/.ssh/id_ed25519" -N ""
    echo "SSH key generated!"
fi

# Try to copy the public key to clipboard (using Windows clip.exe)
if command -v clip.exe &> /dev/null; then
    cat "$HOME/.ssh/id_ed25519.pub" | clip.exe
    echo "Copied public key to Windows clipboard! You can now paste it into GitHub Settings."
else
    echo "Public Key (Copy this to GitHub):"
    cat "$HOME/.ssh/id_ed25519.pub"
fi

echo "Link to GitHub SSH Settings: https://github.com/settings/keys"
