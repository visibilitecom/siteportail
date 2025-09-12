# Static Website Deployment

A production-ready static website server for the Portails & Motorisation site with all requested features.

## 🚀 Quick Start

```bash
# Simple deployment
./deploy.sh

# Or manually with Node.js
yarn install
yarn start

# Or with Docker
docker build -t static-site .
docker run -p 3000:3000 static-site

# Or with Docker Compose (includes HTTPS)
docker-compose up -d
```

## ✅ Features Implemented

- **Document Root**: `public/` directory as requested
- **Homepage**: `index.html` served as the main page
- **Clean URLs**: Access pages without `.html` extension
- **Gzip Compression**: Enabled for all content
- **Asset Caching**: `/assets/` cached for 1 day (86400s)
- **Port Configuration**: Runs on port 3000 (or `$PORT` if defined)
- **HTTPS Ready**: Nginx reverse proxy configuration included

## 🌐 URL Examples

| Original | Clean URL |
|----------|-----------|
| `/index.html` | `/` |
| `/services/installation-moteur-portail.html` | `/services/installation-moteur-portail` |
| `/marques/depannage-portail-came.html` | `/marques/depannage-portail-came` |

## 📁 Project Structure

```
/app/
├── public/                    # Document root (static files)
│   ├── index.html            # Homepage
│   ├── assets/               # Static assets (cached 1 day)
│   │   ├── styles.css
│   │   └── app.js
│   ├── services/             # Service pages
│   └── marques/              # Brand pages
├── static-server.js          # Express server
├── Dockerfile                # Docker configuration
├── docker-compose.yml        # Docker Compose with nginx
├── nginx.conf                # Nginx reverse proxy config
└── deploy.sh                 # Deployment script
```

## 🧪 Testing

```bash
# Test homepage
curl http://localhost:3000/

# Test clean URLs
curl http://localhost:3000/services/installation-moteur-portail

# Test asset caching
curl -I http://localhost:3000/assets/styles.css

# Test compression
curl -H "Accept-Encoding: gzip" -I http://localhost:3000/
```

## 🔒 HTTPS Configuration

For production HTTPS, update the nginx configuration:

1. **SSL Certificates**: Place your certificates in `./ssl/`
2. **Domain Configuration**: Update `server_name` in `nginx.conf`

## 📊 Performance Features

- **Gzip Compression**: ~60-80% size reduction
- **Static Asset Caching**: 1 day cache for `/assets/`
- **Clean URLs**: No redirect overhead
- **Health Checks**: Built-in health endpoints