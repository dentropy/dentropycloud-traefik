# Just the local install of authelia

## Instructions

* Get SMTP Server Credentials (optional for now)
* Setup subdomains
  * authelia
  * secure
  * traefik
  * public

```
docker network create traefik-homelab
./setup.sh
docker-compose down
docker-compose --env-file ../.env up -d
```

## Welcome Text Reminder 

You can now visit the following locations:
- https://public.example.com - Bypasses Authelia
- https://traefik.example.com - Secured with Authelia one-factor authentication
- https://secure.example.com - Secured with Authelia two-factor authentication (see note below)

You will need to authorize the self-signed certificate upon visiting each domain.
To visit https://secure.example.com you will need to register a device for second factor authentication and confirm by clicking on a link sent by email. Since this is a demo with a fake email address, the content of the email will be stored in './authelia/notification.txt'.
Upon registering, you can grab this link easily by running the following command: 'grep -Eo '"https://.*" ' ./authelia/notification.txt'.

## Update with the following

```
cd ~

git clone https://github.com/authelia/authelia.git

cp authelia/examples/compose/local/* ./dentropycloud-traefik/traefik/setup-authelia.
```