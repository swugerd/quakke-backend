#!/bin/bash
echo "🔧 Building production image..."

cd ~/projects/quakke-backend

git fetch origin master
git checkout master
git reset --hard origin/master

cd scripts
docker build -t quakke-backend:prod .

