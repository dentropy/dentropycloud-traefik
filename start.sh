#!/bin/bash
startApps=("miniflux" "misskey" "monica" "qbitttorrent" "static" "syncthing" "trilium" "wikijs")
for value in ${!startApps[@]}
do
    echo ${startApps[$value]}
    cd ${startApps[$value]} && docker-compose --env-file ../.env up -d
    cd ..
done
cd traefik/setup-authelia-secure
docker-compose --env-file ../../.env up -d 
