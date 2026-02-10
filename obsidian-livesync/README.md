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

Don't forget to specify `SERVER_COUNTRIES` and `SERVER_CITIES`

### Port mapping
Go to *[airvpn.org](https://airvpn.org) > Client Area > Port* and add a new port, write its value to the `FIREWALL_VPN_INPUT_PORTS` field in the .env file

### CouchDB
Setup a user and password in the .env file

### LiveSync
Configure

## Start the service
```shell
docker compose up -d
```
## Setup the db
Run couchdb-init.sh for initialise
```shell
docker exec -it couchdb bash -c "$(curl -fsSL https://raw.githubusercontent.com/vrtmrz/obsidian-livesync/main/utils/couchdb/couchdb-init.sh)"
```



# Usage
In obsidian, install the Self-hosted LiveSync plugin and follow the instructions