#!/bin/bash
echo "🧹 Cleaning up old Docker images..."

docker images --filter "reference=quakke-backend:prod" -q | xargs -r docker rmi -f
docker ps -a --filter "name=prod" -q | xargs -r docker rm -f
docker volume ls --filter "name=postgres_prod" -q | xargs -r docker volume rm -f

echo "Cleanup complete!"
