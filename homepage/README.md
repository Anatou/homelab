# Homepage

Github [homepage](https://github.com/gethomepage/homepage/) project

# Installation

## Setup on proxmox

**Setup on a LXC**
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/homepage.sh)"`

## Pull files

```bash
apt update && apt install wget
wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/.env
wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/proxmox.yaml
wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/services.yaml
wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/settings.yaml

mv proxmox.yaml /opt/homepage/config/proxmox.yaml
mv services.yaml /opt/homepage/config/services.yaml
mv settings.yaml /opt/homepage/config/settings.yaml
```

## Configuration

Configure the .env file with the service's ip, token, and other infos.

# Usage

Go to `http://<homepage_ip>` and enjoy !