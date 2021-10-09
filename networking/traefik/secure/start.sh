#!/bin/sh
docker network create traefik-homelab
docker-compose --env-file ../../../.env up -d
