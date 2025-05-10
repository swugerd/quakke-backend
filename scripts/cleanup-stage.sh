#!/bin/bash
echo "🧹 Stage environment cleanup..."

echo "🗑 Removing stopped stage containers..."
docker ps -a --filter "name=stage" --filter "status=exited" -q | xargs -r docker rm -v 2>/dev/null || true

echo "🗑 Removing old stage images..."
CURRENT_IMAGE=$(docker images -q quakke-backend:stage)
docker images --filter "reference=quakke-backend*" -q | grep -v "$CURRENT_IMAGE" | xargs -r docker rmi -f 2>/dev/null || true

echo "🧽 Cleaning unused stage volumes..."
docker volume ls -q --filter "name=postgres_stage" | xargs -r docker volume rm -f 2>/dev/null || true

echo "✅ Stage cleanup complete!"
