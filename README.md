# dentropycloud-traefik

Here is my homelab deployment. 

```
docker network create traefik-homelab

mv env_example .env

vim .env

# Edit vim file accordingly

cd traefik/setup-authelia-secure

bash setup.sh

# Follow instructions

# Wait 3 minutes

docker-compose --env-file ../../.env down

docker-compose --env-file ../../.env up

# To add more applications just go into the application folder and run  the below command

docker-compose --env-file ../.env up
```
