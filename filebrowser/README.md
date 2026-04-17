# Quantum Filebrowser

Github [quantum filebrowser](https://github.com/gtsteffaniak/filebrowser) project

# Installation

## Setup on Proxmox

**Setup a Docker LXC** \
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/docker.sh)"`

**Setup a Docker VM** \
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/docker-vm.sh)"`

## Mount a shared folder on a LXC

In the Proxmox host
```bash
nano /etc/pve/lxc/102.conf
# ADD
mp0: /mnt/movies,mp=/mnt/movies # or any folder
```

In the LXC
```bash
mkdir /mnt/movies
reboot
```

## Pull files

```bash
apt update && apt install wget
wget https://github.com/Anatou/homelab/raw/refs/heads/main/filebrowser/compose.yaml
wget https://github.com/Anatou/homelab/raw/refs/heads/main/filebrowser/quantum.yaml
mkdir data
mv quantum.yaml data/
```
## Start the service
```bash
docker compose up -d
```

# Usage
Go to `http://<filbrowser_ip>` and follow the instructions