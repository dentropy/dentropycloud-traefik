#!/bin/sh
docker-compose --env-file ../../.env up -d 
echo "Username: admin"
echo "Password: admin"
