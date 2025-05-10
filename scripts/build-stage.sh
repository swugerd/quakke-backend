#!/bin/bash
echo "🔧 Building staging image..."

cd ../
docker build -t quakke-backend:stage .
