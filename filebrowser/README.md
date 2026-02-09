wget https://github.com/Anatou/homelab/raw/refs/heads/main/filebrowser/compose.yaml
wget https://github.com/Anatou/homelab/raw/refs/heads/main/filebrowser/quantum.yaml
# À /root
mkdir data
mv quantum.yaml data/
docker compose up -d