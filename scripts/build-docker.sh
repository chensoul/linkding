#!/usr/bin/env bash

# Enable BuildKit for better caching
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain
export SOURCE_DATE_EPOCH="1704067200"

version=$(<version.txt)

# Local build uses linux/amd64 only. For multi-arch builds, use GitHub Actions.
PLATFORM="${PLATFORM:-linux/amd64}"

# Set registry (default: Docker Hub)
REGISTRY="${REGISTRY:-docker.io}"
USERNAME="${DOCKER_USERNAME:-}"
PASSWORD="${DOCKER_PASSWORD:-}"

# Push mode: set to "true" or non-empty to push images
PUSH="${PUSH:-}"

# Login to registry if credentials are provided
if [ -n "$USERNAME" ] && [ -n "$PASSWORD" ]; then
  echo "Logging in to $REGISTRY..."
  echo "$PASSWORD" | docker login "$REGISTRY" -u "$USERNAME" --password-stdin
fi

# Set push flag for buildx
if [ -n "$PUSH" ]; then
  PUSH_FLAG="--push"
  LOAD_FLAG=""
  echo "Push mode: enabled"
else
  PUSH_FLAG=""
  LOAD_FLAG="--load"
  echo "Push mode: disabled (images loaded locally)"
fi

echo "Building Debian images..."
docker buildx build --platform $PLATFORM \
  -f docker/default.Dockerfile \
  -t zhijunio/linkding:latest \
  -t zhijunio/linkding:${version} \
  --target linkding \
  --cache-from type=local,src=/tmp/.buildx-cache-debian \
  --cache-to type=local,dest=/tmp/.buildx-cache-debian,mode=max \
  $PUSH_FLAG $LOAD_FLAG \
  .

docker buildx build --platform $PLATFORM \
  -f docker/default.Dockerfile \
  -t zhijunio/linkding:latest-plus \
  -t zhijunio/linkding:${version}-plus \
  --target linkding-plus \
  --cache-from type=local,src=/tmp/.buildx-cache-debian \
  --cache-to type=local,dest=/tmp/.buildx-cache-debian,mode=max \
  $PUSH_FLAG $LOAD_FLAG \
  .

echo "Building Alpine images..."
docker buildx build --platform $PLATFORM \
  -f docker/alpine.Dockerfile \
  -t zhijunio/linkding:latest-alpine \
  -t zhijunio/linkding:${version}-alpine \
  --target linkding \
  --cache-from type=local,src=/tmp/.buildx-cache-alpine \
  --cache-to type=local,dest=/tmp/.buildx-cache-alpine,mode=max \
  $PUSH_FLAG $LOAD_FLAG \
  .

docker buildx build --platform $PLATFORM \
  -f docker/alpine.Dockerfile \
  -t zhijunio/linkding:latest-plus-alpine \
  -t zhijunio/linkding:${version}-plus-alpine \
  --target linkding-plus \
  --cache-from type=local,src=/tmp/.buildx-cache-alpine \
  --cache-to type=local,dest=/tmp/.buildx-cache-alpine,mode=max \
  $PUSH_FLAG $LOAD_FLAG \
  .

echo ""
echo "Build completed!"
if [ -z "$PUSH" ]; then
  echo "Images:"
  docker images zhijunio/linkding --format "{{.Repository}}:{{.Tag}} - {{.Size}}" | grep -v test
fi

echo ""
echo "Note: BuildKit local cache is stored in /tmp/.buildx-cache-*"
echo "      Set PUSH=1 to push images (requires DOCKER_USERNAME/PASSWORD)."
echo "      Set PLATFORM=linux/amd64,linux/arm64 for multi-arch builds."
