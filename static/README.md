# Static site

## Configure
To serve a static site for `changeme.domain.tld`:
```
echo CHATONS_STATIC_SITE=changeme >> .env
echo CHATONS_DOMAIN=domain.tld >> .env
```

## Deploy
```
docker-compose up -d
```

You just need to copy your static site content to:
```
/srv/chatons/static/changeme
```

Then ensure that read access to /srv/chatons/static/changeme files and folders is given to everybody as the nginx user needs to see them

Now you have a static site at URL `changeme.localhost` or `changeme.${CHATONS_DOMAIN}`

