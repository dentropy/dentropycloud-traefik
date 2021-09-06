#!/bin/sh
docker volume create trilium
docker-compose --env-file ../../.env up -d 
