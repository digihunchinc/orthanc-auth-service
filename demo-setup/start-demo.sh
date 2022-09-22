#!/bin/bash
set -o xtrace
set -o errexit

pushd ../sources
docker build -t orthancteam/orthanc-share -f Dockerfile.orthanc-share .
docker build -t orthancteam/orthanc-anonymizer  -f Dockerfile.orthanc-anonymizer .

popd

COMPOSE_FILE=docker-compose.yml:docker-compose.meddream.yml docker-compose --project-directory ..  up --build