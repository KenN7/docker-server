# proxyta.net prod setup with Let's Encrypt certificates
touch acme.json htdigest
chmod 600 acme.json
docker-compose up -d

# Add an user
htdigest htdigest traefik <USER>
