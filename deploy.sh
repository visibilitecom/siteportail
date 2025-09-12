#!/bin/bash

# Static Website Deployment Script
echo "🚀 Deploying static website..."

# Build and start with Docker Compose
if command -v docker-compose &> /dev/null; then
    echo "📦 Building and starting with Docker Compose..."
    docker-compose down
    docker-compose build
    docker-compose up -d
    echo "✅ Website deployed at http://localhost:3000"
    echo "✅ HTTPS available at https://localhost (with nginx service)"
elif command -v docker &> /dev/null; then
    echo "📦 Building and starting with Docker..."
    docker build -t static-site .
    docker stop static-site-container 2>/dev/null || true
    docker rm static-site-container 2>/dev/null || true
    docker run -d -p 3000:3000 --name static-site-container static-site
    echo "✅ Website deployed at http://localhost:3000"
else
    echo "📦 Starting with Node.js..."
    yarn install
    yarn start &
    echo "✅ Website deployed at http://localhost:3000"
fi

echo ""
echo "🌐 Features enabled:"
echo "  ✓ Clean URLs (without .html)"
echo "  ✓ Gzip compression"
echo "  ✓ Asset caching (1 day)"
echo "  ✓ HTTPS ready"
echo ""
echo "🔗 Test URLs:"
echo "  - Homepage: http://localhost:3000/"
echo "  - Service page: http://localhost:3000/services/installation-moteur-portail"
echo "  - Assets: http://localhost:3000/assets/styles.css"