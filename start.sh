#!/bin/bash
startApps=("miniflux" "misskey" "monica" "qbitttorrent" "static" "syncthing" "trilium" "wikijs")
for value in ${!startApps[@]}
do
    echo ${startApps[$value]}
    cd ${startApps[$value]} && ./start.sh
    cd ..
done
cd traefik/setup-authelia-secure
./start.sh
