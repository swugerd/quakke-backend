#!/bin/bash
echo "🚀 Deploying staging..."

docker-compose up -d --force-recreate backend-stage

echo "✅ Staging deployment completed!"
