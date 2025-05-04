#!/bin/bash
echo "🔧 Building production image..."
docker build -t quakke-backend:prod .
