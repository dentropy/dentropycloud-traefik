#!/bin/bash

# App List: "audioserve" "ELK" "filebrowser" "jellyfin" "misskey" "monica" "qbittorrent" "static" "syncthing" "trilium" "whoami-test"
startApps=("miniflux" "misskey" "trilium" "wikijs")

cd apps
for value in ${!startApps[@]}
do
    echo ${startApps[$value]}
    cd ${startApps[$value]} && ./start.sh
    cd ..
done
cd ..
# traefik options: authelia, authelia-secure, secure
taefik="authelia-secure"
# Networking apps: wireguard
cd networking/traefik/${authelia-secure}
./start.sh
cd ../..
cd wireguard
./sart.sh
