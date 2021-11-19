## Builder
FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/hetzner

## Main image
FROM caddy:${CADDY_VERSION:-2-alpine}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
