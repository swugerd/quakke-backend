#!/bin/bash
echo "🔧 Building staging image..."

cd ~/projects/quakke-backend

if [ -n "$BRANCH" ]; then
  echo "📥 Pulling branch: $BRANCH"
  git fetch origin "$BRANCH"
  git checkout "$BRANCH" || git checkout -b "$BRANCH" origin/"$BRANCH"
  git reset --hard origin/"$BRANCH"
else
  echo "⚠️ BRANCH variable is not set. Skipping git pull."
fi

docker build -t quakke-backend:stage .

echo "✅ Build completed"
