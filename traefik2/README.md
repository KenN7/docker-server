## docker network for proxified services
```bash
> docker network create web
```

## create auth and acme file
```bash
> touch acme.json
> chmod 600 acme.json
```
### Add an user
```bash
> htpasswd -c htpasswd user
```

## Add labels to proxified services (replace SERVICE and vars)
```
- "traefik.enable=true"
- "traefik.http.routers.SERVICE.rule=Host(`${PROXY_SERVICE:-traefik}.${PROXY_DOMAIN:-localhost}`)"
- "traefik.http.services.SERVICE.loadbalancer.server.port=8082" #optional for specific port on service
- "traefik.http.routers.SERVICE.tls.certresolver=lets"
- "traefik.http.routers.SERVICE.entrypoints=websecure"
```

## (Optionnal) Overrride router rule for Host
Since Host rules change on a server basis, you can choose to leave it untouched
and orride it with a separate compose file.
Example for traefik dashboard (change the service name and rule to accomodate with other services)
> vim docker-compose.override.yml
```
version: '3'

services:
  traefik:
    labels:
      - "traefik.http.routers.traefik.rule=Host(`hass.lan`)"
```

## Create and edit the dynamic conf
> mv dynamic_conf.toml.sample dynamic_conf.toml

## Run
> docker-compose up -d
