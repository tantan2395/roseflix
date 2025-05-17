#!/bin/sh
set -e

echo "Injecting runtime environment variables into index.html..."

# Define the environment variables you want to inject
env_vars="REACT_APP_API_KEY REACT_APP_SERVER_URL"

# Inject variables into index.html
for var in $env_vars; do
  value=$(printenv $var)
  if [ -n "$value" ]; then
    echo "Injecting $var=$value"
    sed -i "s|__${var}__|$value|g" /usr/share/nginx/html/index.html
  fi
done

exec "$@"
