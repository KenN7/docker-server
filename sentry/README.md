# Sentry

Sentry is an error tracking software:
https://sentry.io

## Configure

```bash
echo SENTRY_SECRET_KEY=$(openssl rand -base64 32) >> .env
echo SENTRY_EMAIL_HOST=changeme >> .env
echo SENTRY_EMAIL_PORT=changeme >> .env
echo SENTRY_EMAIL_USER=changeme >> .env
echo SENTRY_EMAIL_PASSWORD=changeme >> .env
echo SENTRY_EMAIL_USE_TLS=changeme >> .env
```

## Deploy

```bash
docker-compose up -d
docker-compose exec sentry sentry upgrade
```
