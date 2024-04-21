# Deluge with vpn

## Configure
Create a `.env` file containing the following:

```bash
VPN_SERVICE_PROVIDER=custom 
VPN_PORT_FORWARDING=on 
VPN_PORT_FORWARDING_PROVIDER= # your vpn provider
VPN_TYPE=wireguard
VPN_ENDPOINT_IP= # Insert your VPN endpoint IP address here 
VPN_ENDPOINT_PORT= # Insert your VPN endpoint port here
WIREGUARD_PUBLIC_KEY=  # Insert your WireGuard public key here
WIREGUARD_PRIVATE_KEY= # Insert your WireGuard private key here
WIREGUARD_ADDRESSES=   # Insert your WireGuard address assignments here (e.g., 10.147.18.2/32)
DELUGE_USER=  # Insert your Deluge username here
DELUGE_PASSWORD=  # Insert your Deluge password here
```



## Deploy

```bash
docker-compose up -d
```
