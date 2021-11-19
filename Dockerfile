ARG CADDY_VERSION=2-alpine
ARG BUILDER_VERSION=2-builder-alpine

## Builder
FROM caddy:$BUILDER_VERSION AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/hetzner

## Main image
FROM caddy:$CADDY_VERSION

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
