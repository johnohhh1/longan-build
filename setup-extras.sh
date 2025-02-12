#!/bin/bash

# Update package lists
sudo apt-get update

# Install ARM cross-compilation tools
echo "Installing ARM toolchain..."
sudo apt-get install -y \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf \
    qemu-user-static \
    binfmt-support

# Install additional development tools
echo "Installing development tools..."
sudo apt-get install -y \
    nano \
    vim \
    android-tools-adb \
    android-tools-fastboot \
    git-lfs \
    screen \
    tmux

# Clean up
sudo apt-get clean
sudo apt-get autoremove -y

echo "Extra tools installation complete!"
