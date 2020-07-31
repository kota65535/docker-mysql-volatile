#!/usr/bin/env bash
set -eux

FROM="mysql:latest"
REPOSITORY_NAME="kota65535/mysql-volatile"

docker pull ${FROM}
curl https://raw.githubusercontent.com/gdraheim/docker-copyedit/master/docker-copyedit.py | python - FROM ${FROM} REMOVE ALL VOLUMES INTO ${REPOSITORY_NAME}
docker push ${REPOSITORY_NAME}
