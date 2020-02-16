# Streama

## Configure
```
echo MYSQL_ROOT_PASSWORD=$(openssl rand -base64 32) >> .env
echo MYSQL_PASSWORD=$(openssl rand -base64 32) >> .env
```

## Deploy

```bash
docker-compose up -d
```
