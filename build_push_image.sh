#!/bin/sh

echo $GH_TOKEN | docker login ghcr.io -u untillnesss --password-stdin
docker build -t ghcr.io/untillnesss/item-app:v1 .
docker push ghcr.io/untillnesss/item-app:v1