# My Homelab
Welcome in my homelab 👋. This repo serves as documentation (not complete though, some infos are in my private obsidian vault) and cloud storage to pull my files from.

This repo is bound to be in perpetual work in progress. I will try to keep a list of what runs, what runs and is documented, and what does not run at all !

# My services

Here are my services that I run and some info about them. Some of them are not even in this repo, this is because I used someone else's configuration, often from the [Proxmox VE Scripts](https://community-scripts.org/scripts) webiste (a very handy one).

They all run in a private and separate network at home so they cannot interact with my domestic network. The current setup is temporary (for around a year or two) because I currently do not have full authority over my home networking. To mitigate those limitations, I make heavy use of VPNs ([tailscale](https://tailscale.com/) for mesh network and [AirVPN](https://airvpn.org/) for reverse-proxying) to expose some services publicly.

| Service 		 | Status | Notes |
| --- | --- | --- |
| Jellyfin | LXC · Not documented | Media streaming · From [Proxmox VE Scripts](https://community-scripts.org/scripts) |
| Torrenting suite | VM · Documented | Media sharing · Inspired by [TechHutTV](https://github.com/TechHutTV/homelab/tree/main/media) · Publicly exposed using [AirVPN's](https://airvpn.org/) port forwarding |
| Homepage | LXC · Documented | From [Proxmox VE Scripts](https://community-scripts.org/scripts) |
| Reverse-Proxy | VM · Documented | Reverse-proxy · Custom made using bricks from the ***torrenting suite*** and my ***self-hosted obsidian livesync*** · Publicly exposed using [AirVPN's](https://airvpn.org/) port forwarding  |
| Obsidian Self-hosted Livesync | VM · Documented | Custom made for [obsidian-livesync](https://github.com/vrtmrz/obsidian-livesync) · Publicly exposed using [AirVPN's](https://airvpn.org/) port forwarding |
| Tailscale end node | LXC · Not documented | Mesh networking access point · From [iqfareez's blog](https://iqfareez.com/blog/access-proxmox-remotely-with-tailscale) |
| BentoPDF | LXC · Not documented | PDF manipulation · From [Proxmox VE Scripts](https://community-scripts.org/scripts) |
| ConvertX | LXC · Not documented | File convertion · From [Proxmox VE Scripts](https://community-scripts.org/scripts) |
| Wallos | LXC · Not documented | File convertion · From [Proxmox VE Scripts](https://community-scripts.org/scripts) |
| Quantum Filebrowser | LXC · Documented | File browser · From [Quantum Filebrowser's documentation](https://filebrowserquantum.com/en/docs/getting-started/docker/) |
| Ebook2Audiobook | LXC · Not documented | IA Audiobook creator · From [ebook2audiobook's Github](https://github.com/DrewThomasson/ebook2audiobook) & running in a Debian LXC from [Proxmox VE Scripts](https://community-scripts.org/scripts) |
| | | |

