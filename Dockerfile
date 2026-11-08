# VLESS + WebSocket + TLS（TLS 由平台/前置 Caddy 终止，容器内只跑明文 WS）
# 适用于：Fly.io / Koyeb / Render / Railway / Zeabur / 任意 Docker VPS
FROM alpine:3.20

ARG XRAY_VER=26.10.31
ARG TARGETARCH=64

RUN apk add --no-cache curl unzip ca-certificates tzdata

# 下载并安装 Xray-core（官方 release 资产名：Xray-linux-64.zip）
RUN set -eux; \
    curl -fsSL -o /tmp/xray.zip \
      "https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VER}/Xray-linux-${TARGETARCH}.zip"; \
    unzip -o /tmp/xray.zip -d /usr/local/bin; \
    chmod +x /usr/local/bin/xray; \
    rm -f /tmp/xray.zip; \
    /usr/local/bin/xray version

COPY config.template.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV PORT=8080 \
    UUID=e974e5e0-fd9e-41de-8ce0-238ad038f222 \
    WS_PATH=/86e7d17b

EXPOSE 8080
CMD ["/entrypoint.sh"]
