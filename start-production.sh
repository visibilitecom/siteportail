#!/bin/bash

echo "🚀 Starting Static Website Server in Production Mode..."

# Set production environment
export NODE_ENV=production
export PORT=${PORT:-3000}

# Stop any existing processes
pkill -f "node static-server.js" 2>/dev/null || true

# Start the server
echo "📦 Starting server on port $PORT..."
node static-server.js &
SERVER_PID=$!

# Wait for server to start
sleep 3

# Health check
if curl -f -s http://localhost:$PORT/ > /dev/null; then
    echo "✅ Server started successfully!"
    echo "🌐 Website available at: http://localhost:$PORT"
    echo "📊 Server PID: $SERVER_PID"
    echo ""
    echo "🔧 Features enabled:"
    echo "  ✓ Document root: public/"
    echo "  ✓ Homepage: index.html"  
    echo "  ✓ Clean URLs (no .html extension)"
    echo "  ✓ Gzip compression"
    echo "  ✓ Asset caching (1 day)"
    echo "  ✓ Port: $PORT"
    echo ""
    echo "🧪 Test URLs:"
    echo "  curl http://localhost:$PORT/"
    echo "  curl http://localhost:$PORT/services/installation-moteur-portail"
    echo "  curl -I http://localhost:$PORT/assets/styles.css"
    echo ""
    echo "To stop: kill $SERVER_PID"
else
    echo "❌ Server failed to start"
    exit 1
fi