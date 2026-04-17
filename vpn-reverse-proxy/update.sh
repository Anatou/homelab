rm Caddyfile
curl -L https://github.com/Anatou/homelab/raw/refs/heads/main/vpn-reverse-proxy/Caddyfile > Caddyfile
docker exec -it caddy /bin/sh -c "cd /etc/caddy && caddy reload"