#!/bin/bash

PASS=$(openssl rand -base64 32)
echo POSTGRES_PASSWORD=$PASS >> .env
echo DB_PASS=$PASS >> .env
