#cloud-config
autoinstall:
  version: 1
  
  refresh-installer:
    update: false

  locale: "en_US.UTF-8"
  keyboard:
    layout: "us"
  timezone: "Etc/UTC"

  identity:
    realname: "Packer Admin"
    username: packer
    hostname: ubuntu-server
    password: '$6$u2bQ9pVh0gR8s8wT$V8C0D9ZQm6H6rCw7F0n9o6GQ2VYpQh7n7ZCw9eFQxQpQG5mVb1ZkCk0QH0pQ1Fq9o6sV0ZCw6nFQe9kZ1GQ/'

  user-data:
    users:
      - name: packer
        groups: sudo
        shell: /bin/bash
        sudo: ALL=(ALL) NOPASSWD:ALL

  storage:
    layout:
      name: direct

  network:
    network:
      version: 2
      ethernets:
        id0:
          match:
            name: e*
          dhcp4: true

  source:
    id: ubuntu-server-minimal
    search_drivers: false

  ssh:
    install-server: true
    allow-pw: true
    authorized-keys:
      - "${ssh_key}"

  packages:
    - qemu-guest-agent
    - curl

  shutdown: reboot
