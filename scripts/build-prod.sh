#!/bin/bash
echo "🔧 Building production image..."

cd ~/projects/quakke_backend/scripts
docker build -t quakke-backend:prod .
