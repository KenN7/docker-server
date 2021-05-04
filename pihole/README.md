# pihole

## Create network with knot
```bash
docker network create dns
```
find ip of this container on the dns network:
```bash
docker network inspect bridge
```
Edit knot conf with ip of this container


## Edit .env with password:
```bash
echo WEBPASSWORD=$(openssl rand -base64 32) >> .env
echo ADMIN_EMAIL=YOUREMAIL >> .env
```

## Launch
```bash 
docker-compose up -d
```

