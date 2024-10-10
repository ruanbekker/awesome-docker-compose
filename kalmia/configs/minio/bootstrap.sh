#!/usr/bin/env sh

set -x

apk add --no-cache minio-client netcat-openbsd

# Define the host and port
HOST="$MINIO_HOST"
PORT="9000"

# Loop until the connection is successful
while ! nc -z "$HOST" "$PORT"; do
    echo "Waiting for connection to $HOST on port $PORT"
    sleep 5
done

echo "Connection to $HOST on port $PORT successful"

mcli alias set local ${AWS_ENDPOINT} ${AWS_ACCESS_KEY_ID} ${AWS_SECRET_ACCESS_KEY}
mcli mb -p local/${AWS_BUCKET}

exit 0

