# Knot-dns

## Copy conf
```bash 
cp knot.conf.sample ${CONF_ROOT_DIR:-/srv/docker}/knot/config/knot.sample
```

## Edit zones
```bash 
vim ${CONF_ROOT_DIR:-/srv/docker}/knot/config/knot.sample`
```

## Launch
```bash 
docker-compose up -d`
```
