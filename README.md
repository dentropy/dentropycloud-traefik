# dentropycloud-traefik

Here is my homelab deployment. 

```
docker network create traefik-homelab

cp env_example .env

nano .env

# Edit file accordingly
# ONLY MY_EMAIL, MY_DOMAIN, and VOLUME_DIR are required
# VOLUME_DIR can be set to /srv for example
VOLUME_DIR=/srv
# SPACING MATTERS

cd traefik/setup-authelia-secure

bash setup.sh

# Follow instructions

# Wait 3 minutes

./stop

./start
```
