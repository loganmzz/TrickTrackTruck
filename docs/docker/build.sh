#!/usr/bin/bash

SCRIPT_FILE=$(which "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_FILE")

. "${SCRIPT_DIR}/env.rc"
cd "$SCRIPT_DIR"
echo "Building Docker image ${IMAGE_TAG}"
docker build --force-rm --tag=${IMAGE_TAG} .
