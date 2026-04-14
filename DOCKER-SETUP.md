# Docker Desktop with WSL 2 Setup Guide

Your WSL 2 environment is currently not integrated with Docker Desktop. To fix this, follow these steps:

## 1. Enable WSL Integration in Docker Desktop
1.  Open **Docker Desktop** on Windows.
2.  Click the **Settings** (gear icon) in the top right.
3.  Navigate to **Resources** > **WSL Integration**.
4.  Ensure **Enable integration with my default WSL distro** is checked.
5.  Find your specific Ubuntu/WSL distro in the list and toggle the switch to **ON**.
6.  Click **Apply & Restart**.

## 2. Verify in WSL
After applying the settings, run the following command in your terminal:
```bash
docker version
```
If successful, you should see both the Client and Server version information.

## 3. Troubleshooting
If the `docker` command is still not found:
- Restart your WSL instance by running `wsl --shutdown` in PowerShell/CMD and then reopening your terminal.
- Ensure your user is in the `docker` group (usually handled automatically by Docker Desktop, but can be checked with `groups`).
