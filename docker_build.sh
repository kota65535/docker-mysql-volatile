#!/usr/bin/env bash
set -eux

usage() {
  cat << EOF
usage: bash $(basename $0) --version <version>
EOF
}

# parse options
while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
      --version)
      VERSION="$2"
      shift 2
      ;;
      *)    # unknown option
      shift # past argument
      ;;
  esac
done

FROM="mysql:${VERSION}"
REPOSITORY_NAME="kota65535/mysql-volatile"

docker pull ${FROM}
curl https://raw.githubusercontent.com/gdraheim/docker-copyedit/master/docker-copyedit.py | python - FROM ${FROM} REMOVE ALL VOLUMES INTO ${REPOSITORY_NAME}:${VERSION}
docker push ${REPOSITORY_NAME}:${VERSION}
