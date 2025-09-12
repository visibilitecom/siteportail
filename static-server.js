const express = require('express');
const path = require('path');
const compression = require('compression');

const app = express();
const port = process.env.PORT || 3000;

// Enable gzip compression
app.use(compression());

// Cache assets in /assets/ for 1 day (86400 seconds)
app.use('/assets', express.static(path.join(__dirname, 'public', 'assets'), {
  maxAge: '1d',
  etag: true,
  lastModified: true
}));

// Serve static files from public directory with clean URLs
app.use(express.static(path.join(__dirname, 'public'), {
  extensions: ['html'], // Enable clean URLs without .html extension
  index: 'index.html'
}));

// Start server
app.listen(port, '0.0.0.0', () => {
  console.log(`Static website server running on port ${port}`);
  console.log(`Visit: http://localhost:${port}`);
  console.log('Document root: public/');
  console.log('Features:');
  console.log('  ✓ Clean URLs (without .html)');
  console.log('  ✓ Gzip compression enabled');
  console.log('  ✓ Assets cached for 1 day');
  console.log('  ✓ HTTPS ready (behind reverse proxy)');
});

module.exports = app;