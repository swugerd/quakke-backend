#!/bin/bash
echo "🔧 Building staging image..."

cd ~/projects/quakke_backend/scripts
docker build -t quakke-backend:stage .
