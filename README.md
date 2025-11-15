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
```
---

## How to execute the script

1. Make the script executable (first time only):

```bash
chmod +x setup.sh
```
2. Run the Script
```
./setup.sh
```

The script will create and activate a virtual environment (venv/)

Install pip and required packages

Create .gitignore if missing

Log output to setup.log with timestamps

---

## Example Output

Terminal Output:
[2025-11-15 18:07:04] [INFO] Starting project setup...
[2025-11-15 18:07:04] [INFO] Checking for virtual environment
[2025-11-15 18:07:04] [WARNING] Virtual Environment Exists, Activating
[2025-11-15 18:07:04] [SUCCESS] Virtual Environment Activated
[2025-11-15 18:07:04] [INFO] Upgrading pip version
[2025-11-15 18:07:05] Requirement already satisfied: pip in ./venv/lib/python3.12/site-packages (25.3)
[2025-11-15 18:07:06] [SUCCESS] Pip upgraded to latest version
[2025-11-15 18:07:06] [INFO] checking for .gitignore
[2025-11-15 18:07:06] [WARNING] .gitignore file exists, skip creation
[2025-11-15 18:07:06] [INFO] Installing Python packages (requests, pandas)...
[2025-11-15 18:07:07] [WARNING] requests already installed — skipping.
[2025-11-15 18:07:07] [WARNING] pandas already installed — skipping.
[2025-11-15 18:07:07] [SUCCESS] Setup complete!

---

## Challenges faced and lessons learned
Writing clean logs: Initially, terminal colors (ANSI escape codes) ended up in the log file, making it unreadable. Solving this required careful redirection and filtering so that colored output remains in the terminal but logs are plain text with timestamps.

Handling errors safely: Ensuring that any failure in pip, virtual environment creation, or activation immediately stops the script with a clear error message improved script robustness.

---

## Notes

The script assumes python3 is installed. If not, follow the prerequisites section first.

The log file (setup.log) grows indefinitely — consider rotating or clearing it periodically for production use.
