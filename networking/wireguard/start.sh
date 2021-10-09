#!/bin/bash
docker-compose --env-file ../../.env up -d
docker exec -it wireguard ip route add 10.13.13.0/24 via 10.133.0.1 dev eth0

# docker exec -it wireguard bash
