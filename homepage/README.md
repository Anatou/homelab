# Homepage

Github [homepage](https://github.com/gethomepage/homepage/) project

# Installation

## Setup on proxmox

**Setup on a LXC**
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/homepage.sh)"`

## Pull the files

```bash
apt update && apt install wget
wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/.env
wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/update.sh
wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/update-env.sh
chmod +x update.sh
chmod +x update-env.sh
./update.sh
```

## `.env` file configuration

Configure the .env file with the service's ip, token, and other infos.

## Edit the service

You need to edit homepage's systemd service in order to use the `.env` file.

To do so, edit `nano /etc/systemd/system/homepage.service` to add the following line in the `[Service]` section:
```txt
EnvironmentFile=/root/.env
```

Then run `systemctl daemon-reload && systemctl restart homepage.service` to apply settings and restart the service.

# Usage

Go to `http://<homepage_ip>` and enjoy !

# Update

Run `./update.sh` to update homepage's cosmetic settings.

It will not update the `.env` file, you need to run separately `./update-env.sh` to update it. This separation allows for easy cosmetic update with the `./update.sh` script.

The `./update-env.sh` script is not able to properly merge your settings so it appends them together, you need to remove the obsolete lines.