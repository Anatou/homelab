source .env
until (curl -X POST "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_cluster_setup" -H "Content-Type: application/json" -d "{\"action\":\"enable_single_node\",\"username\":\"${COUCHDB_USER}\",\"password\":\"${COUCHDB_PASSWORD}\",\"bind_address\":\"0.0.0.0\",\"port\":${FIREWALL_VPN_INPUT_PORTS},\"singlenode\":true}"); do sleep 5; done
until (curl -X PUT "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_node/${NODE}/_config/chttpd/require_valid_user" -H "Content-Type: application/json" -d '"true"'); do sleep 5; done
until (curl -X PUT "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_node/${NODE}/_config/chttpd_auth/require_valid_user" -H "Content-Type: application/json" -d '"true"'); do sleep 5; done
until (curl -X PUT "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_node/${NODE}/_config/httpd/WWW-Authenticate" -H "Content-Type: application/json" -d '"Basic realm=\"couchdb\""'); do sleep 5; done
until (curl -X PUT "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_node/${NODE}/_config/httpd/enable_cors" -H "Content-Type: application/json" -d '"true"'); do sleep 5; done
until (curl -X PUT "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_node/${NODE}/_config/chttpd/enable_cors" -H "Content-Type: application/json" -d '"true"'); do sleep 5; done
until (curl -X PUT "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_node/${NODE}/_config/chttpd/max_http_request_size" -H "Content-Type: application/json" -d '"4294967296"'); do sleep 5; done
until (curl -X PUT "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_node/${NODE}/_config/couchdb/max_document_size" -H "Content-Type: application/json" -d '"50000000"'); do sleep 5; done
until (curl -X PUT "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_node/${NODE}/_config/cors/credentials" -H "Content-Type: application/json" -d '"true"'); do sleep 5; done
until (curl -X PUT "http://${COUCHDB_USER}:${COUCHDB_PASSWORD}@127.0.0.1:${FIREWALL_VPN_INPUT_PORTS}/_node/${NODE}/_config/cors/origins" -H "Content-Type: application/json" -d '"app://obsidian.md,capacitor://localhost,http://localhost"'); do sleep 5; done

