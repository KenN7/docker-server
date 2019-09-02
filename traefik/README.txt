# proxyta.net prod setup with Let's Encrypt certificates
export ACME_EMAIL=your@email.address  >> .env
export CHATONS_DOMAIN=example.org >> .env
touch acme.json htdigest
chmod 600 acme.json
docker-compose up -d

# Add an user
htdigest htdigest <
