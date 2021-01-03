# Nextcloud

https://nextcloud.com/

## Configure
```
echo POSTGRES_PASSWORD=$(openssl rand -base64 32) >> .env
```

## Deploy

```bash
docker-compose up -d
```

Then you can connect to your Nextcloud instance to perform the installation.

If you prefer to install the instance in command line, you can launch the following commands (Replace variables below by their value ): 

```
docker-compose exec --user www-data app php /var/www/html/occ maintenance:install --database "pgsql" --database-name "nextcloud"  --database-host="db" --database-user "nextcloud" --database-pass "$POSTGRES_PASSWORD" --admin-user "$ADIMN_USER" --admin-pass "$ADMIN_PASSWORD"
docker-compose exec --user www-data app php occ config:system:set trusted_domains 0 --value=$CHATONS_SERVICE.$CHATONS_DOMAIN
docker-compose exec --user www-data app php occ config:system:set overwrite.cli.url --value=http://$CHATONS_SERVICE.$CHATONS_DOMAIN
# to ensure reset password is working fine behind proxy
docker-compose exec --user www-data app php occ config:system:set  overwriteprotocol --value="https" --type="string"
```
## Deploy with scaling of the "app" container

```
docker-compose up -d --scale app=3  # to get 3 instance of the "app" container
```


## Proxy setting
Add this to config.php, in order to work with the traefik proxy
```
'trusted_proxies' =>
  array (
    0 => '172.x.x.x',
  ),
```

## Launch commands

For example to put in maintenance mode:
```
docker-compose exec --user www-data app php occ maintenance:mode --on
```
