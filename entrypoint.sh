#!/bin/sh
set -e

PORT="${PORT:-8080}"
UUID="${UUID:-e974e5e0-fd9e-41de-8ce0-238ad038f222}"
WS_PATH="${WS_PATH:-/86e7d17b}"

# 保证 ws 路径以 / 开头
case "$WS_PATH" in
  /*) : ;;
  *) WS_PATH="/$WS_PATH" ;;
esac

sed \
  -e "s|__PORT__|${PORT}|g" \
  -e "s|__UUID__|${UUID}|g" \
  -e "s|__WSPATH__|${WS_PATH}|g" \
  /etc/xray/config.template.json > /etc/xray/config.json

echo "[entrypoint] PORT=$PORT UUID=$UUID WS_PATH=$WS_PATH"
echo "[entrypoint] ---- generated config ----"
cat /etc/xray/config.json
echo "[entrypoint] ---------------------------"

exec /usr/local/bin/xray -c /etc/xray/config.json
