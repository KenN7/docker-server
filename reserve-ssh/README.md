# Reverse ssh tunnel
## Configure
```bash
echo PASSWORD=$(openssl rand -base64 32) >> .env
mkdir -p keys/{host,clients}
```

## Set up host (Nated host you want to connect to)
To test things out, from a host NATed server, you could issue a command such as:
```bash
ssh -p 2222 root@domain.tld
```

The command will prompt you for the password of the root user in the container 
(e.g. secret in the previous example) and let you in. The command supposes that
you can access your server on domain.tld and that its firewall permits 
connections on port 2222. However, to open a permanent tunnel, you would rather
enter a command such as:
```bash 
ssh -fN -R 10000:localhost:22 -p 2222 root@domain.tld
```

This would create a reverse tunnel on port 10000 so you can connect to your 
server from the tunnel host running the docker container using (user being a 
user on the NATed host server):
```bash
ssh -p 10000 user@domain.tld
```

### Permanent setup
Using autossh and through making sure you can login without the need for a 
password, you should be able to keep those connections alive for longer 
periods of time. More information is available in this guide, but in summary 
you should perform the following steps:

On the remote server, create the DSA key (if necessary) and copy it to the 
host running the container through the following commands:
```bash
ssh-copy-id -p 2222 root@domain.tld
```

To keep the connection open at all times through autossh, issue the following:
```bash
autossh -M 10099 -fN -o "PubkeyAuthentication=yes" -o "StrictHostKeyChecking=false" -o "PasswordAuthentication=no" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R 10000:localhost:22 -p 2222 root@domain.tld
```

