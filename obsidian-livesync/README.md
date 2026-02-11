# Obsidian self-hosted LiveSync

Github [obsidian-livesync](https://github.com/vrtmrz/obsidian-livesync?tab=readme-ov-file) project

# Installation

## Setup on Proxmox

**Setup a Docker LXC** \
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/docker.sh)"`

**Setup a Docker VM** \
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/docker-vm.sh)"`

## Pull files

```bash
apt update && apt install wget
wget https://github.com/Anatou/homelab/raw/refs/heads/main/obsidian-livesync/compose.yaml
wget https://github.com/Anatou/homelab/raw/refs/heads/main/obsidian-livesync/.env
wget https://github.com/Anatou/homelab/raw/refs/heads/main/obsidian-livesync/docker.ini
mkdir couchdb-etc
mkdir couchdb-data
mv docker.ini couchdb-etc/
chown -R 1000:1000 couchdb-data/
chown -R 1000:1000 couchdb-etc/
```

## Configuration

### Vpn
Go to *[airvpn.org](https://airvpn.org) > Client Area > Config Generator* and make a configuration for Linux /w Wireguard

AirVPN's configuration file values maps to the following fields in the .env file :
| .env                    | AirVPN config    |
| ----------------------- | ---------------- |
| WIREGUARD_PUBLIC_KEY    | PublicKey        |
| WIREGUARD_PRIVATE_KEY   | PrivateKey       |
| WIREGUARD_PRESHARED_KEY | PresharedKey<br> |
| WIREGUARD_ADDRESSES     | Address          |

Don't forget to specify `SERVER_COUNTRIES`, `SERVER_CITIES`, and `SERVER_NAMES` to persist your public IP through system reboots

### Port mapping
Go to *[airvpn.org](https://airvpn.org) > Client Area > Port* and add a new port
- write its value to the `FIREWALL_VPN_INPUT_PORTS` field in the *.env* file
- write its value to the `port` sections in the *docker.ini*

### CouchDB
Setup a user and password in the .env file

## Start the service
```shell
docker compose up -d
```
## Setup the db
Run setup_db.sh to initialise the db
```shell
bash -c "$(https://github.com/Anatou/homelab/raw/refs/heads/main/obsidian-livesync/setup_db.sh)"
```

# Usage
In obsidian, install the Self-hosted LiveSync plugin and follow the instructions. It is **strongly recommended** to use a new vault or backup your vault before configuring LiveSync.

The *database* setting is a new parameter you can decide now, it identifies your vault. You can use multiple databases on the same couchdb node to have multiple independent vaults synchronized.

After plugin configuration, you may want to change synchronization settings to "LiveSync" to syncronize in real-time