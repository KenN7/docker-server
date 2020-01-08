# docker network for proxified services
> docker network create web

# create auth and acme file
> touch acme.json htdigest
> chmod 600 acme.json
## Add an user
htdigest htdigest traefik <USER>

# Add labels to proxified services (replace SERVICE and vars)
- "traefik.enable=true"
- "traefik.http.routers.SERVICE.rule=Host(`${PROXY_SERVICE:-traefik}.${PROXY_DOMAIN:-localhost}`)"
- "traefik.http.services.SERVICE.loadbalancer.server.port=8082" #optional for
  specific port on service
- "traefik.http.routers.SERVICE.tls.certresolver=lets"
- "traefik.http.routers.SERVICE.entrypoints=websecure"

# Run
> docker-compose up -d
