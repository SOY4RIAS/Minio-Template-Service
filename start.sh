#!/bin/bash
cp .env.example .env

function generatePassword {
  openssl rand -hex 8
}

ACCESS_KEY=$(generatePassword)
SECRET_KEY=$(generatePassword)

sed -i.bak \
  -e "s#MINIO_ACCESS_KEY=.*#MINIO_ACCESS_KEY=${ACCESS_KEY}#g" \
  -e "s#MINIO_SECRET_KEY=.*#MINIO_SECRET_KEY=${SECRET_KEY}#g" \
  "./.env"


docker-compose up -d
