#!/bin/bash

set -eo pipefail

echo "Starting system cleanup for image preparation..."

# 1. Truncate machine-id so it gets regenerated on next boot
echo "Truncating machine IDs..."
sudo truncate -s 0 /etc/machine-id
if [ -f /var/lib/dbus/machine-id ]; then
    sudo truncate -s 0 /var/lib/dbus/machine-id
fi

# 2. Remove the current SSH host keys
echo "Removing SSH host keys..."
sudo rm -f /etc/ssh/ssh_host_*

# 3. Clean up apt and logs
echo "Cleaning apt cache and system logs..."
sudo apt-get clean
sudo apt-get autoremove -y
sudo rm -rf /var/log/*

# 4. Final Cloud-init clean
echo "Resetting cloud-init..."
sudo cloud-init clean --logs

echo "Cleanup complete. The system is ready to be imaged."
