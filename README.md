# Proxmox Packer Templates

This repository contains Packer configurations to automate the creation of Ubuntu Server templates on a Proxmox VE cluster.

## Prerequisites
1. **Packer**: Installed on your local machine
2. **Poxmox VE**: Access to a Proxmox node with an ISO uploaded (default: `ubuntu-24.04.3-live-server-amd64.iso`)
3. **SSH Key**: An existing Ed25519 SSH key pair at `~/.ssh/id_ed25519`

## Environment Variables
Before running Packer, you must export your Proxmox credentials.
```
export PROXMOX_USERNAME="user@pve"
export PROXMOX_PASSWORD="your-password-here"
```
## Usage
1. **Tailored Images**\
The configuration is designed to build two templates.
    * **Base Image**: Includes only basic cleanup and qemu guest agent.
    * **Docker Image**: Includes the Docker Engine installation script.
2. **Building the Template**\
To initialize the plugins and start the build:
```
# Initialize Packer plugins
packer init .

# Validate the template
packer validate .

# Build the template
packer build .
```
3. **Customizing for Different Ubuntu Versions**\
The `boot_command` and `iso_file` are currently designed for Ubuntu 24.04. If you use a different version, ensure you update the `var.iso_file`.
