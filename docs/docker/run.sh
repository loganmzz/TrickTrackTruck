#!/usr/bin/bash

SCRIPT_FILE=$(which "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_FILE")
SOURCE_DIR=$(cd "$SCRIPT_DIR"/..; pwd)

. "${SCRIPT_DIR}/env.rc"
cd "$SCRIPT_DIR"

CONTAINER_ID=$(docker ps -aqf "name=${CONTAINER_NAME}")
if [ ! -z "${CONTAINER_ID}" ]; then
  docker rm --force "${CONTAINER_ID}"
fi
docker run \
  --name      ${CONTAINER_NAME}               \
  --publish   4000:4000                       \
  --volume   "/${SOURCE_DIR}:/var/jekyll/src" \
  --workdir  "/var/jekyll/src"                \
  --rm                                        \
  ${IMAGE_TAG}
