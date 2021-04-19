#!/bin/sh

ssh -o StrictHostKeyChecking=no -i $PRIVATE_KEY $SERVER_USER@$SERVER_IP << 'ENDSSH'
  mkdir -p ~/msdata/prod/list/front/mediafiles
  mkdir -p ~/msdata/prod/list/front/staticfiles
  mkdir -p ~/msdata/prod/list/rapi/mediafiles
  mkdir -p ~/msdata/prod/list/rapi/staticfiles
  mkdir -p ~/list/prod/
  cd ~/list/prod/
  export $(cat gitlab.prod.env | xargs)
  # export $(grep -v '^#' prod.env | xargs -d '\n')
  docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
  docker-compose -f docker-compose.prod.yml --env-file=prod.env pull
  docker-compose -f docker-compose.prod.yml --env-file=prod.env config
  docker-compose -f docker-compose.prod.yml --env-file=prod.env up -d --force-recreate
  docker ps
  docker images -f dangling=true
  docker image prune -f
  # docker images
ENDSSH

## Test ssh script
# ssh -o StrictHostKeyChecking=no -p 29 parth@86.21.69.140 << 'ENDSSH'
#   cd ~/docker/django/
#   ls -l
# ENDSSH
