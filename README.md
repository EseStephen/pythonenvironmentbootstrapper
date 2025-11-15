# pythonenvironmentbootstrapper
# Python Project Setup Script

## What the script does

This Bash script automates the setup of a Python project environment. It performs the following tasks:

1. **Checks for a Python virtual environment**  
   - Creates one if it does not exist (`venv/`)  
   - Activates the virtual environment  

2. **Upgrades pip** to the latest version inside the virtual environment  

3. **Generates a `.gitignore`** if one does not exist, ignoring Python caches, virtual environments, and build artifacts  

4. **Installs essential Python packages** (`requests` and `pandas`) if they are not already installed  

5. **Logs all output** with timestamps to `setup.log` while still showing colored messages in the terminal  

---

## Prerequisites

Before running the script, ensure Python 3 is installed on your system along with the `python3-venv` package:

```bash
# Update package lists
sudo apt update

# Install Python 3 if not already installed
sudo apt install python3

# Install the venv module for virtual environments
sudo apt install python3-venv
