#!/usr/bin/env bash
# A simple script to create a new Python project with a virtual environment. 
# OS: Fedora Linux

# Use environment variable or default to current directory
PROJECT_BASE_DIR="${PROJECT_BASE_DIR:-$(pwd)}"

# Get project name from arg or prompt
PROJECT_NAME="$1"
if [[ -z "$PROJECT_NAME" ]]; then
    read -p "Enter project name: " PROJECT_NAME
fi

# If still empty, exit
if [[ -z "$PROJECT_NAME" ]]; then
    echo "No project name provided. Exiting."
    exit 1
fi

# Create project folder inside base directory
TARGET_DIR="$PROJECT_BASE_DIR/$PROJECT_NAME"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit 1

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Create basic files
echo "# $PROJECT_NAME" > README.md
touch requirements.txt
mkdir -p src
touch src/__init__.py

# Optional: Initialize git
git init >/dev/null 2>&1

echo "Python project '$PROJECT_NAME' created at $TARGET_DIR."
echo "Virtual environment activated. Start coding inside src/!"
