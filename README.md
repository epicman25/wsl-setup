# WSL Development Environment Setup

This repository contains all the setup instructions, system specifications, and automation scripts for my WSL environment. It is optimized for backend and Python development.

## Project Structure
- `configs/`: Backups of active configuration files (e.g., `.zshrc`, `.gitconfig`).
- `info/`: Snapshots of system specifications and installed packages.
- `scripts/`: Modular bash scripts to automate the setup process.

## How to Set Up on a New Machine

1. **Clone this repository:**
   ```bash
   git clone https://github.com/Rewardsy/wsl-setup.git
   cd wsl-setup
   ```

2. **Run the installation scripts in order:**
   
   - **Step 1: Install System Tools**
     ```bash
     ./scripts/01-system-tools.sh
     ```
     *Installs `nala`, `gh`, `bat`, `ripgrep`, `htop`, etc.*

   - **Step 2: Install Python Development Tools**
     ```bash
     ./scripts/02-python-tools.sh
     ```
     *Installs `pipx`, `mypy`, `pgcli`, `bandit`, etc.*

   - **Step 3: Setup Zsh & Oh My Zsh**
     ```bash
     ./scripts/03-zsh-setup.sh
     ```
     *Installs Zsh, Oh My Zsh, custom plugins, and links the backed-up configuration files.*

## Updating Backups
To update the configurations stored in this repository with your current active settings:
```bash
./scripts/backup-configs.sh
```
*Then commit and push your changes.*

---

## Current System Specifications
- **OS**: Linux (WSL)
- **Architecture**: x86_64
- **Last Updated**: $(date)
