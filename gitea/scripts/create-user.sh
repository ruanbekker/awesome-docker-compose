#!/usr/bin/env sh

set -x

until curl -s "http://localhost:3000" >/dev/null; do
  echo "Waiting for Gitea to start..."
  sleep 5
done

echo "[gitea:bootstrap] creating gitea user ${GITEA_USERNAME}"
gitea --config /data/gitea/conf/app.ini admin \
  user create --admin \
  --username "${GITEA_USERNAME}" \
  --password "${GITEA_PASSWORD}" \
  --email "admin@admin.local" \
  --must-change-password=false

echo "[gitea:bootstrap] creating registration token"
curl -XGET -H 'accept: application/json' -u "${GITEA_USERNAME}:${GITEA_PASSWORD}" \
  --url "http://gitea:3000/api/v1/admin/runners/registration-token"

