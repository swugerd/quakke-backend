#!/bin/bash
echo "🚀 Deploying production..."

docker-compose up -d --force-recreate backend-prod

echo "🚀 Production deployment completed!"
