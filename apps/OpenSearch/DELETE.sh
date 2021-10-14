#!/bin/bash
./stop.sh
docker volume rm elasticsearch
docker volume create elasticsearch
rm -rf docker-elk
