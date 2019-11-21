# Knot-dns

## Copy conf
```bash 
cp knot.conf.sample ${CONF_ROOT_DIR:-/srv/docker}/knot/config/knot.conf
```

## Edit zones
```bash 
vim ${CONF_ROOT_DIR:-/srv/docker}/knot/config/knot.conf
```

## Launch
```bash 
docker-compose up -d
```
