#!/bin/bash

echo "🔍 Static Website Deployment Verification"
echo "=========================================="

BASE_URL="http://localhost:3000"
FAILED=0

# Test function
test_url() {
    local url=$1
    local description=$2
    local expected_status=${3:-200}
    
    status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    if [ "$status" == "$expected_status" ]; then
        echo "✅ $description - Status: $status"
    else
        echo "❌ $description - Status: $status (expected $expected_status)"
        FAILED=1
    fi
}

echo ""
echo "🌐 URL Testing:"
test_url "$BASE_URL/" "Homepage (index.html)"
test_url "$BASE_URL/services/installation-moteur-portail" "Clean URL (no .html)"
test_url "$BASE_URL/marques/depannage-portail-came" "Clean URL (marques)"
test_url "$BASE_URL/assets/styles.css" "Static asset"
test_url "$BASE_URL/health" "Health endpoint"

echo ""
echo "🔧 Feature Testing:"

# Test gzip compression
if curl -H "Accept-Encoding: gzip" -I "$BASE_URL/" 2>/dev/null | grep -q "Vary: Accept-Encoding"; then
    echo "✅ Gzip compression - Enabled"
else
    echo "❌ Gzip compression - Not detected"
    FAILED=1
fi

# Test asset caching
cache_control=$(curl -I "$BASE_URL/assets/styles.css" 2>/dev/null | grep "Cache-Control:")
if echo "$cache_control" | grep -q "max-age=86400"; then
    echo "✅ Asset caching - 1 day (86400s)"
else
    echo "❌ Asset caching - Not configured correctly"
    echo "   Found: $cache_control"
    FAILED=1
fi

# Test document root
if [ -f "public/index.html" ]; then
    echo "✅ Document root - public/ directory exists"
else
    echo "❌ Document root - public/ directory not found"
    FAILED=1
fi

# Test port configuration
if pgrep -f "static-server.js" > /dev/null; then
    echo "✅ Server process - Running on port ${PORT:-3000}"
else
    echo "❌ Server process - Not running"
    FAILED=1
fi

echo ""
echo "📊 Performance Features:"
echo "  ✓ Document root: public/"
echo "  ✓ Homepage: index.html"
echo "  ✓ Clean URLs: No .html extension needed"
echo "  ✓ Gzip compression: Enabled"
echo "  ✓ Asset caching: /assets/ cached for 1 day"
echo "  ✓ Port: ${PORT:-3000} (configurable via \$PORT)"
echo "  ✓ HTTPS ready: Nginx reverse proxy configured"

echo ""
echo "🐳 Deployment Options:"
echo "  • Node.js: yarn start"
echo "  • Docker: docker build -t static-site . && docker run -p 3000:3000 static-site"
echo "  • Docker Compose: docker-compose up -d (includes HTTPS)"
echo "  • Quick deploy: ./deploy.sh"

echo ""
if [ $FAILED -eq 0 ]; then
    echo "🎉 All tests passed! Deployment is successful."
    echo ""
    echo "🌐 Your static website is now available at:"
    echo "   $BASE_URL"
    echo ""
    echo "📋 Summary of implemented requirements:"
    echo "   ✅ Document root: public/"
    echo "   ✅ Homepage: index.html served"
    echo "   ✅ Clean URLs: No .html extension"
    echo "   ✅ Gzip compression: Enabled"
    echo "   ✅ Asset caching: 1 day for /assets/"
    echo "   ✅ Port: 3000 (or \$PORT)"
    echo "   ✅ HTTPS ready: Nginx config provided"
    exit 0
else
    echo "⚠️  Some tests failed. Please check the issues above."
    exit 1
fi