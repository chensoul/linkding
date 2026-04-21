# Build stage: Node.js (shared)
FROM node:22-alpine AS node-build
WORKDIR /etc/linkding
COPY package.json package-lock.json ./
RUN --mount=type=cache,target=/root/.npm,id=npm-cache \
    npm ci
COPY rollup.config.mjs postcss.config.js ./
COPY bookmarks/frontend ./bookmarks/frontend/
COPY bookmarks/styles ./bookmarks/styles/
RUN --mount=type=cache,target=node_modules,id=npm-build \
    npm run build

# Build stage: uBlock Origin Lite
FROM node:22-alpine AS ublock-build
WORKDIR /etc/linkding
ARG UBOL_TAG=2026.308.1810
RUN --mount=type=cache,target=/var/cache/apk,id=ublock-apk \
    apk add --no-cache curl jq unzip && \
    curl -sLf "https://github.com/uBlockOrigin/uBOL-home/releases/download/${UBOL_TAG}/uBOLite_${UBOL_TAG}.chromium.zip" -o uBOLite.zip && \
    unzip -q uBOLite.zip -d uBOLite.chromium.mv3 && rm uBOLite.zip && \
    jq '.declarative_net_request.rule_resources |= map(if .id == "annoyances-overlays" or .id == "annoyances-cookies" or .id == "annoyances-social" or .id == "annoyances-widgets" or .id == "annoyances-others" then .enabled = true else . end)' \
        uBOLite.chromium.mv3/manifest.json > temp.json && mv temp.json uBOLite.chromium.mv3/manifest.json && \
    rm -rf /var/cache/apk/*

# Use pre-built base image (Python + uv + dependencies + ICU)
# See: .github/workflows/build-base.yaml
FROM ghcr.io/zhijunio/linkding:base-debian AS base

# Build stage: Static files and translations
FROM base AS static-build
WORKDIR /etc/linkding
COPY --from=node-build /etc/linkding/bookmarks/static bookmarks/static/
COPY bookmarks/*.py ./bookmarks/
COPY bookmarks/management bookmarks/management/
COPY bookmarks/templates bookmarks/templates/
COPY bookmarks/settings bookmarks/settings/
COPY bookmarks/urls.py bookmarks/migrations.py ./bookmarks/
COPY locale ./locale/
COPY requirements.txt pyproject.toml uv.lock manage.py bootstrap.sh ./
COPY *.conf .
RUN mkdir -p data && python manage.py collectstatic --noinput && python manage.py compilemessages

# Final stage: linkding (Debian)
FROM python:3.13.7-slim-trixie AS linkding
RUN apt-get update && apt-get -y install --no-install-recommends \
    media-types libpq-dev libicu-dev libssl3t64 curl gettext && \
    adduser --system --group --uid 82 www-data || true && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /etc/linkding
COPY --from=base /venv .venv/
COPY --from=base /libicu.so .
COPY --from=static-build /etc/linkding/data ./data/
COPY --from=static-build /etc/linkding/bookmarks/static bookmarks/static/
COPY --from=static-build /etc/linkding/bookmarks/locale bookmarks/locale/
COPY --from=static-build /etc/linkding/manage.py .
COPY --from=static-build /etc/linkding/bootstrap.sh .
COPY --from=static-build /etc/linkding/*.py .
COPY --from=static-build /etc/linkding/*.conf .
HEALTHCHECK --interval=30s --retries=3 --timeout=1s CMD curl -f http://localhost:${LD_SERVER_PORT:-9090}/${LD_CONTEXT_PATH}health || exit 1
CMD ["/bin/bash", "./bootstrap.sh"]

# Runtime stage: linkding-plus base (Debian)
FROM python:3.13.7-slim-trixie AS linkding-plus-base
RUN apt-get update && apt-get -y install --no-install-recommends \
    media-types libpq-dev libicu-dev libssl3t64 curl gettext chromium && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /usr/share/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get -y install --no-install-recommends nodejs && \
    mkdir -p chromium-profile && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R www-data:www-data chromium-profile 2>/dev/null || true
RUN --mount=type=cache,target=/root/.npm,id=npm-global \
    npm install -g single-file-cli@2.0.75
ENV VIRTUAL_ENV=/venv PATH="/venv/bin:$PATH" LD_ENABLE_SNAPSHOTS=True NPM_CONFIG_CACHE=/tmp/npm-cache
COPY --from=base /venv .venv/

# Final stage: linkding-plus (Debian)
FROM linkding-plus-base AS linkding-plus
WORKDIR /etc/linkding
COPY --from=base /libicu.so .
COPY --from=static-build /etc/linkding/data ./data/
COPY --from=static-build /etc/linkding/bookmarks/static bookmarks/static/
COPY --from=static-build /etc/linkding/bookmarks/locale bookmarks/locale/
COPY --from=ublock-build /etc/linkding/uBOLite.chromium.mv3 uBOLite.chromium.mv3/
COPY --from=static-build /etc/linkding/manage.py .
COPY --from=static-build /etc/linkding/bootstrap.sh .
COPY --from=static-build /etc/linkding/*.py .
COPY --from=static-build /etc/linkding/*.conf .
HEALTHCHECK --interval=30s --retries=3 --timeout=1s CMD curl -f http://localhost:${LD_SERVER_PORT:-9090}/${LD_CONTEXT_PATH}health || exit 1
CMD ["/bin/bash", "./bootstrap.sh"]
