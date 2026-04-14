#!/bin/bash
set -e

echo "=== Installing Python Development Tools with Pipx ==="

# Ensure pipx path is configured
pipx ensurepath

# List of tools to install via pipx
TOOLS=("pgcli" "bandit" "mypy" "httpie")

for tool in "${TOOLS[@]}"; do
    echo "Installing $tool..."
    pipx install "$tool" || echo "$tool already installed or failed"
done

echo "=== Python tools installation complete ==="
