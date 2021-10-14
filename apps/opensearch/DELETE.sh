#!/bin/bash
./stop.sh
docker volume rm opensearch-data1
docker volume create opensearch-data1
docker volume rm opensearch-data2
docker volume create opensearch-data2
