# Knot-dns

## Copy conf
cp knot.conf.sample ${CONF_ROOT_DIR:-/srv/docker}/knot/config/knot.sample

## Edit zones
vim ${CONF_ROOT_DIR:-/srv/docker}/knot/config/knot.sample

## Launch
docker-compose up -d

