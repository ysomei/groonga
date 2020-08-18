#!/bin/bash

echo "install development applications for test"
docker-compose build --no-cache
docker-compose up --force-recreate

