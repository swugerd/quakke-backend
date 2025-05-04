#!/bin/bash
echo "🔧 Building staging image..."
docker build -t quakke-backend:stage .
