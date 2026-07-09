#!/usr/bin/env bash
set -e

APP_NAME="roulista"
APP_DIR="/home/deploy/apps/roulista"

echo "🚀 Deploy started for: $APP_NAME"
echo "📁 App dir: $APP_DIR"
echo "----------------------------------"

cd "$APP_DIR"

echo "🔄 Git pulling..."
git pull

echo "🛑 Stopping containers..."
docker compose down

echo "🔨 Building images (no cache)..."
docker compose build --no-cache

echo "▶️  Starting containers..."
docker compose up -d

echo "----------------------------------"
echo "📦 Container status:"
docker ps --filter "name=$APP_NAME"

echo "✅ Deploy finished successfully!"
