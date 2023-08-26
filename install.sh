#!/bin/bash

# Define the list of required Python dependencies
required_dependencies=("tqdm" "termcolor" "hashlib" "argparse")

# Function to check if a Python dependency is installed
check_dependency() {
    local dep="$1"
    if ! python3 -c "import $dep" &>/dev/null; then
        echo "$dep is missing."
        return 1
    fi
}

# Function to install a missing Python dependency
install_dependency() {
    local dep="$1"
    echo "[⚠️] Installing $dep..."
    if ! sudo pip3 install "$dep"; then
        echo "[⛔] Failed to install $dep. Please install it manually."
        exit 1
    fi
}

# Check for missing Python dependencies
missing_dependencies=()
for dep in "${required_dependencies[@]}"; do
    if ! check_dependency "$dep"; then
        missing_dependencies+=("$dep")
    fi
done

# Install missing Python dependencies if any
if [ ${#missing_dependencies[@]} -eq 0 ]; then
    echo "✅ All required Python dependencies are already installed."
    echo "✅ Copying Files Now"
else
    echo "Missing Python dependencies:"
    for dep in "${missing_dependencies[@]}"; do
        echo "- $dep"
        install_dependency "$dep"
    done
fi

# Copy the hasher.py script to /usr/local/bin/ as root
sudo cp hasher.py /usr/local/bin/hasher

# Make the script executable as root
sudo chmod +x /usr/local/bin/hasher

echo "✅ Installation complete."
