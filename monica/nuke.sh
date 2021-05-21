#!/bin/bash
docker-compose --env-file ../.env down
docker volume rm mysql
docker volume rm data
