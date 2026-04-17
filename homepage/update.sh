wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/proxmox.yaml
wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/services.yaml
wget https://github.com/Anatou/homelab/raw/refs/heads/main/homepage/settings.yaml

mv proxmox.yaml /opt/homepage/config/proxmox.yaml
mv services.yaml /opt/homepage/config/services.yaml
mv settings.yaml /opt/homepage/config/settings.yaml