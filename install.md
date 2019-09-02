# Deploy your kittens

## Install docker & docker-compose
```
# See https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-repository
apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -

echo "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

apt update && apt install -y docker-ce python3-pip

# install docker-compose
pip3 install docker-compose

# Start docker
systemctl start docker
systemctl enable docker
```

## Add this repo
```
cd
git clone --recursive https://framagit.org/oxyta.net/docker-atelier.git
cd docker-atelier
```

## Deploy the proxy
```
docker network create web
```

And then you can go in the `proxy/` folder and in the environment you want:
- [dev](https://framagit.org/nim65s/proxyta.net/tree/master/dev)
- [prod with letsencrypt](https://framagit.org/nim65s/proxyta.net/tree/master/prod-le/) (look at the README first)
- [prod with your certificates](https://framagit.org/nim65s/proxyta.net/tree/master/prod-ssl/) (look at the README first)

## Configure your domain name and email addresses

```
echo "export CHATONS_DOMAIN=oxyta.net" >> .bashrc
echo "export ACME_EMAIL=acme@${CHATONS_DOMAIN}" >> .bashrc
. .bashrc
```

## Deploy the services you want

- [nextcloud](cloud/) (in the `cloud/` folder)
- [etherpad](pad/) (in the `pad/` folder)
- [oxyta.net's homepage](homepage/) (in the `homepage/` folder)

## Configure mail

[doc](mail)
