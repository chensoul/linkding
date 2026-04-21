#!/usr/bin/env bash

# Enable BuildKit for better caching
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain
export SOURCE_DATE_EPOCH="1704067200"

version=$(<version.txt)

# Local build uses linux/amd64 only. For multi-arch builds, use GitHub Actions.
PLATFORM="linux/amd64"

echo "Building Debian images..."
docker build --target linkding --platform $PLATFORM \
  -f docker/default.Dockerfile \
  -t zhijunio/linkding:latest \
  -t zhijunio/linkding:${version} \
  --cache-from type=local,src=/tmp/.buildx-cache-debian \
  --cache-to type=local,dest=/tmp/.buildx-cache-debian,mode=max \
  .

docker build --target linkding-plus --platform $PLATFORM \
  -f docker/default.Dockerfile \
  -t zhijunio/linkding:latest-plus \
  -t zhijunio/linkding:${version}-plus \
  --cache-from type=local,src=/tmp/.buildx-cache-debian \
  --cache-to type=local,dest=/tmp/.buildx-cache-debian,mode=max \
  .

echo "Building Alpine images..."
docker build --target linkding --platform $PLATFORM \
  -f docker/alpine.Dockerfile \
  -t zhijunio/linkding:latest-alpine \
  -t zhijunio/linkding:${version}-alpine \
  --cache-from type=local,src=/tmp/.buildx-cache-alpine \
  --cache-to type=local,dest=/tmp/.buildx-cache-alpine,mode=max \
  .

docker build --target linkding-plus --platform $PLATFORM \
  -f docker/alpine.Dockerfile \
  -t zhijunio/linkding:latest-plus-alpine \
  -t zhijunio/linkding:${version}-plus-alpine \
  --cache-from type=local,src=/tmp/.buildx-cache-alpine \
  --cache-to type=local,dest=/tmp/.buildx-cache-alpine,mode=max \
  .

echo ""
echo "Build completed! Images:"
docker images zhijunio/linkding --format "{{.Repository}}:{{.Tag}} - {{.Size}}" | grep -v test

echo ""
echo "Note: BuildKit local cache is stored in /tmp/.buildx-cache-*"
