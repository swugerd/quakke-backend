#!/bin/bash
echo "📦 Deploying production environment..."

docker-compose up -d --force-recreate backend-prod

echo "🚀 Production deployment completed."
