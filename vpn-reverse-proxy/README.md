# VPN based Reverse-Proxy

The aim of this reverse proxy is to use [AirVPN's](https://airvpn.org/) port forwarding as an entry point into the isolated homelab network to expose some services.

# Installation

## Setup on Proxmox

**Setup a Docker LXC** \
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/docker.sh)"`

**Setup a Docker VM** \
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/docker-vm.sh)"`

## Pull files

```bash
curl -L https://github.com/Anatou/homelab/raw/refs/heads/main/vpn-reverse-proxy/compose.yaml > compose.yaml
curl -L https://github.com/Anatou/homelab/raw/refs/heads/main/vpn-reverse-proxy/.env > .env
curl -L https://github.com/Anatou/homelab/raw/refs/heads/main/vpn-reverse-proxy/Caddyfile > Caddyfile
curl -L https://github.com/Anatou/homelab/raw/refs/heads/main/vpn-reverse-proxy/Dockerfile > Dockerfile
curl -L https://github.com/Anatou/homelab/raw/refs/heads/main/vpn-reverse-proxy/update.sh > update.sh
chmod +x update.sh
```

## Configuration

### Vpn
Go to *[airvpn.org](https://airvpn.org) > Client Area > Config Generator* and make a configuration for Linux /w Wireguard

AirVPN's configuration file values maps to the following fields in the .env file :
| .env                    | AirVPN config    |
| ----------------------- | ---------------- |
| WIREGUARD_PUBLIC_KEY    | PublicKey        |
| WIREGUARD_PRIVATE_KEY   | PrivateKey       |
| WIREGUARD_PRESHARED_KEY | PresharedKey     |
| WIREGUARD_ADDRESSES     | Address          |

Don't forget to specify `SERVER_COUNTRIES`, `SERVER_CITIES`, and `SERVER_NAMES` to persist your public IP through system reboots

### Port mapping
Go to *[airvpn.org](https://airvpn.org) > Client Area > Port* and add a new port
- write its value to the `FIREWALL_VPN_INPUT_PORTS` field in the *.env* file
- write its value to the `port` sections in the *docker.ini*

Optionnaly you can specify a domain name for airvpn DDNS. It may be used later when configuring DeSEC DDNS.

### DDNS
In order to get HTTPS we need to validate a challenge presented by the ACME. Because we do not have port 80 we will use DNS-01, a DNS-control based challenge.

Go to *[DeSEC](https://desec.io/domains)* and use or create a new domain and copy this domain in the *.env* file (`DOMAIN=xxx`). Then, make a new *A* rule pointing to your VPN IP or a *CNAME* rule pointing to the DDNS name you may have set for the forwarded port.

Then go to *[tokens](https://desec.io/tokens)* and make a new token (or use an old one) and paste it in the *.env* file (`DESEC_TOKEN=xxx`). 

### Caddyfile
The provided Caddyfile shows how the reverse-proxy is used. It may be used as a starting template to make your own configuration.

## Start the service
```shell
docker compose up -d
```

# Update

Run `./update.sh` to easily update (only) the Caddyfile and reload the configuration. The new Caddyfile is pulled from your repo.