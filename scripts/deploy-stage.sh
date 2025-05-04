#!/bin/bash

echo "📦 Deploying staging environment..."

docker-compose up -d --force-recreate backend-stage

echo "🚀 Staging deployment completed."
