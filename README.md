# Traefik Boilerplate

```
docker network create traefik-homelab

mv env_example .env

vim .env

cd secure-setup

docker-compose --env-file ../.env up
```

