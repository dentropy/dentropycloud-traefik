#!/bin/bash
docker-compose --env-file ../.env down
docker volume rm monica-mysql
docker volume rm monica-data
