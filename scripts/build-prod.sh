#!/bin/bash
echo "🔧 Building production image..."

cd ../
docker build -t quakke-backend:prod .
