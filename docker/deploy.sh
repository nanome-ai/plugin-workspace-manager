#!/bin/bash

echo "./deploy.sh $*" > redeploy.sh
chmod +x redeploy.sh

existing=$(docker ps -aq -f name=workspace-manager)
if [ -n "$existing" ]; then
    echo "removing existing container"
    docker rm -f $existing
fi

docker run -d \
--name workspace-manager \
--restart unless-stopped \
-e ARGS="$*" \
workspace-manager
