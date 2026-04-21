# Base image for linkding Alpine builds
# Contains: Python 3.13 + uv + dependencies + ICU compiled
FROM python:3.13.7-alpine3.22 AS build-deps

RUN apk add --no-cache \
    alpine-sdk \
    linux-headers \
    libpq-dev \
    pkgconfig \
    icu-dev \
    sqlite-dev \
    libffi-dev \
    openssl-dev \
    rust \
    cargo \
    gettext \
    curl

WORKDIR /etc/linkding

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    cp /root/.local/bin/uv /usr/local/bin/uv

# Create venv and install dependencies
RUN uv venv /etc/linkding/.venv
COPY pyproject.toml uv.lock ./
ENV VIRTUAL_ENV=/etc/linkding/.venv PATH="/etc/linkding/.venv/bin:$PATH"
RUN --mount=type=cache,target=/root/.cache/uv,id=uv-cache \
    uv sync --no-dev --group postgres

# Compile ICU extension
ARG SQLITE_RELEASE_YEAR=2023
ARG SQLITE_RELEASE=3430000
RUN --mount=type=cache,target=/var/cache/apk,id=apk-cache \
    wget -q https://www.sqlite.org/${SQLITE_RELEASE_YEAR}/sqlite-amalgamation-${SQLITE_RELEASE}.zip && \
    unzip -q sqlite-amalgamation-${SQLITE_RELEASE}.zip && \
    cp sqlite-amalgamation-${SQLITE_RELEASE}/sqlite3.h . && \
    cp sqlite-amalgamation-${SQLITE_RELEASE}/sqlite3ext.h . && \
    wget -q "https://www.sqlite.org/src/raw/ext/icu/icu.c?name=91c021c7e3e8bbba286960810fa303295c622e323567b2e6def4ce58e4466e60" -O icu.c && \
    gcc -O3 -fPIC -shared icu.c `pkg-config --libs --cflags icu-uc icu-io` -o libicu.so && \
    rm -f sqlite-amalgamation-${SQLITE_RELEASE}.zip && rm -rf sqlite-amalgamation-${SQLITE_RELEASE} icu.c

# Export the venv and ICU as final artifacts
FROM scratch
COPY --from=build-deps /etc/linkding/.venv /venv
COPY --from=build-deps /etc/linkding/libicu.so /libicu.so
COPY --from=build-deps /usr/local/bin/uv /uv
ENV VIRTUAL_ENV=/venv PATH="/venv/bin:$PATH"
