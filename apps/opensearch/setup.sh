#!/bin/sh
sudo sysctl -w vm.max_map_count=512000
docker volume create opensearch-data1
docker volume create opensearch-data2

