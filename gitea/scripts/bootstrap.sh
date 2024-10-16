#!/usr/bin/env sh

set -x

apk add docker

until curl -s "http://gitea:3000" >/dev/null; do
  echo "Waiting for Gitea to start..."
  sleep 5
done

echo "creating user"
docker exec --user git gitea sh /data/git/create-user.sh

