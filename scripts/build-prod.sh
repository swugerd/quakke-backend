#!/bin/bash
echo "🔧 Building production image..."

cd ~/projects/quakke-backend

git fetch origin master
git checkout master
git reset --hard origin/master

docker build -t quakke-backend:prod .
