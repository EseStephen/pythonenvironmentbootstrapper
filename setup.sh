#!/bin/bash

set -eo pipefail

LOG_FILE="setup.log"

exec > >(awk '{ print strftime("[%Y-%m-%d %H:%M:%S]"), $0 }' | tee -a "$LOG_FILE") 2>&1

# Colors
INFO="\e[34m[INFO]\e[0m"
SUCCESS="\e[32m[SUCCESS]\e[0m"
WARNING="\e[33m[WARNING]\e[0m"
ERROR="\e[31m[ERROR]\e[0m"

function error_exit {
    echo -e "$ERROR $1"
    exit 1
}

function setup_virtual_environment {
 echo -e "$INFO Checking for virtual environment"

 if [ -d "venv" ]
 then
     echo -e "$WARNING Virtual Environment Exists, Activating"
 else
     echo -e "$INFO Creating Virtual Environment."
     python3 -m venv venv || error_exit "Failed to create virtual environment"
 fi
     source venv/bin/activate || error_exit "Failed to activate virtual environment"
     echo -e "$SUCCESS Virtual Environment Activated"
}


function upgrade_pip_version {
 echo -e "$INFO Upgrading pip version"
 python3 -m pip install --upgrade pip || error_exit "Failed to upgrade pip"
 echo -e "$SUCCESS Pip upgraded to latest version"
}


function generate_git_ignore {
 echo -e "$INFO checking for .gitignore"
 if [ -f ".gitignore" ]; then
     echo -e "$WARNING .gitignore file exists, skip creation"
 else
     echo -e "$INFO Creating gitignore file"
     cat << EOF > .gitignore
# Python
__pycache__/
*.py[cod]
*$py.class

# Virtual Environment
venv/

# Packaging
build/
dist/
*.egg-info/
EOF
    echo -e "$SUCCESS .gitignore created"
   fi
}

function install_packages {
    echo -e "$INFO Installing Python packages (requests, pandas)..."

    for pkg in requests pandas; do
        if python3 -m pip show "$pkg" > /dev/null 2>&1; then
            echo -e "$WARNING $pkg already installed — skipping."
        else
            pip install "$pkg" || error_exit "Failed to install package: $pkg"
            echo -e "$SUCCESS Installed $pkg."
        fi
    done
}


function main {
    echo -e "$INFO Starting project setup..."
    setup_virtual_environment
    upgrade_pip_version
    generate_git_ignore
    install_packages
    echo -e "$SUCCESS Setup complete!"
}

main
