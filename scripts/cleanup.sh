#!/bin/bash
echo "🧹 Cleaning up old Docker images..."

docker image prune -f
docker container prune -f
docker volume prune -f

echo "Cleanup comple!"
