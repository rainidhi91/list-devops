#!/bin/sh

ssh -o StrictHostKeyChecking=no -i $PRIVATE_KEY $SERVER_USER@$SERVER_IP << 'ENDSSH'
  mkdir -p ~/msdata/dev/list/front/mediafiles
  mkdir -p ~/msdata/dev/list/front/staticfiles
  mkdir -p ~/msdata/dev/list/rapi/mediafiles
  mkdir -p ~/msdata/dev/list/rapi/staticfiles
  mkdir -p ~/list/dev/
  cd ~/list/dev/
  export $(cat gitlab.dev.env | xargs)
  # export $(grep -v '^#' dev.env | xargs -d '\n')
  # docker login registry.example.com -u <username> -p <token>
  docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
  # docker pull $CONTAINER_DEV_IMAGE_NGINX
  # docker pull $CONTAINER_RAPI_IMAGE
  # docker pull $CONTAINER_FE_IMAGE
  docker-compose -f docker-compose.dev.yml --env-file=dev.env pull
  docker-compose -f docker-compose.dev.yml --env-file=dev.env config
  docker-compose -f docker-compose.dev.yml --env-file=dev.env up -d --force-recreate
  # docker-compose -f docker-compose.dev.yml --env-file=dev.env up -d --build
  docker ps
  docker images -f dangling=true
  docker image prune -f
  docker images
ENDSSH

## Test ssh script
# ssh -o StrictHostKeyChecking=no -p 29 parth@86.21.69.140 << 'ENDSSH'
#   cd ~/docker/django/
#   ls -l
# ENDSSH
