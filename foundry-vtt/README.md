# Foundry Virtual Tabletop

[Foundry VTT's website](https://foundryvtt.com/)
Unoficial docker port [felddy/foundryvtt-docker](https://github.com/felddy/foundryvtt-docker)

# Installation

## Setup on Proxmox

**Setup a Docker LXC** \
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/docker.sh)"`

**Setup a Docker VM** \
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/docker-vm.sh)"`

## Pull files

```bash
curl -L https://github.com/Anatou/homelab/raw/refs/heads/main/foundry-vtt/compose.yaml > compose.yaml
curl -L https://github.com/Anatou/homelab/raw/refs/heads/main/foundry-vtt/.env > .env
mkdir foundry
chown -R 1000:1000 foundry/
```

## Configuration

Edit the `.env` file and fill the required fields `FOUNDRY_RELEASE_URL` and `FOUNDRY_ADMIN_KEY`.

`FOUNDRY_RELEASE_URL` is the temporary download URL you can acquire from your user profile page on the Foundry website.
1. Navigate to the [Purchased Software Licenses](https://foundryvtt.com/community/anatou/licenses) page.
2. Change the Operating System menu item to `Node.js`.
3. Click the `🔗 Timed URL` button to obtain the temporary URL.
4. Paste this URL in the `.env` file and start the service.

`FOUNDRY_ADMIN_KEY` is an arbitrary key of your choosing (preferably secure)

## Start the service
```shell
docker compose up -d
```

# Usage

Go to http://<ip>:30000