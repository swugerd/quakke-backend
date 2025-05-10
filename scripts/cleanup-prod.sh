#!/bin/bash
echo "🧹 Production environment cleanup..."

echo "🗑 Removing stopped production containers..."
docker ps -a --filter "name=prod" --filter "status=exited" -q | xargs -r docker rm -v 2>/dev/null || true

echo "🗑 Removing old production images..."
CURRENT_IMAGE=$(docker images -q quakke-backend:prod)
docker images --filter "reference=quakke-backend*" -q | grep -v "$CURRENT_IMAGE" | xargs -r docker rmi -f 2>/dev/null || true

echo "🧽 Cleaning unused production volumes..."
docker volume ls -q --filter "name=postgres_prod" | xargs -r docker volume rm -f 2>/dev/null || true

echo "✅ Porduction cleanup complete!"
