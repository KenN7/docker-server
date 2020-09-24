# Wireguard

## Configure
If your kernel is <5.6, first install wireguard kernel module on the host
```bash
sudo apt install wireguard
```

Then setup wireguard: 
```bash
echo SERVERURL=yourserver.url >> .env
echo PEERS=10 >> .env
echo PEERDNS=auto >> .env
echo INTERNAL_SUBNET=172.16.42.0 >> .env
```
Select any number of peers you may have, and a subnet that does
not crash with yours.

Create the modules and config dirs locally
```bash
mkdir modules
mkdir config
```

## Launch
```bash
docker-compose up -d
```

## Help
https://hub.docker.com/r/linuxserver/wireguard
