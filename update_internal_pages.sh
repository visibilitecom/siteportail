#!/bin/bash

echo "🔄 Mise à jour des pages internes..."

# Template du nouveau header
HEADER_TEMPLATE='<header class="header">
  <div class="container nav">
    <div class="logo-container">
      <a class="logo" href="/">
        <div class="logo-icon">
          <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect x="2" y="8" width="28" height="16" rx="2" stroke="currentColor" stroke-width="2" fill="none"/>
            <rect x="6" y="12" width="8" height="8" rx="1" fill="currentColor"/>
            <rect x="18" y="12" width="8" height="8" rx="1" fill="currentColor"/>
            <circle cx="12" cy="6" r="1" fill="currentColor"/>
            <circle cx="20" cy="6" r="1" fill="currentColor"/>
            <path d="M2 16 L8 16" stroke="currentColor" stroke-width="2"/>
            <path d="M24 16 L30 16" stroke="currentColor" stroke-width="2"/>
          </svg>
        </div>
        <div class="logo-text">
          <span class="logo-main">Portails</span>
          <span class="logo-sub">& Motorisation</span>
        </div>
      </a>
    </div>
    
    <nav class="main-nav">
      <ul class="nav-menu">
        <li><a href="/#services">Services</a></li>
        <li><a href="/#marques">Marques</a></li>
        <li><a href="/#zones">Zones</a></li>
        <li><a href="/#contact">Contact</a></li>
      </ul>
    </nav>
    
    <div class="header-actions">
      <a class="phone-link" href="tel:0600000000">📞 06 00 00 00 00</a>
      <a class="cta" href="/#devis">Devis Gratuit</a>
    </div>
    
    <!-- Mobile menu button -->
    <button class="mobile-menu-btn" onclick="toggleMobileMenu()">
      <span></span>
      <span></span>
      <span></span>
    </button>
  </div>
  
  <!-- Mobile menu -->
  <div class="mobile-menu">
    <ul>
      <li><a href="/#services" onclick="toggleMobileMenu()">Services</a></li>
      <li><a href="/#marques" onclick="toggleMobileMenu()">Marques</a></li>
      <li><a href="/#zones" onclick="toggleMobileMenu()">Zones</a></li>
      <li><a href="/#contact" onclick="toggleMobileMenu()">Contact</a></li>
      <li><a href="/#devis" class="cta-mobile" onclick="toggleMobileMenu()">Devis Gratuit</a></li>
    </ul>
  </div>
</header>'

# Mise à jour des pages de services
for file in /app/public/services/*.html; do
    echo "Mise à jour: $file"
    
    # Mise à jour du CSS avec cache busting
    sed -i 's|/assets/styles.css|/assets/styles.css?v=2|g' "$file"
    
    # Remplacement de l'ancien header
    sed -i '/<header class="header">/,/<\/header>/c\
<header class="header">\
  <div class="container nav">\
    <div class="logo-container">\
      <a class="logo" href="/">\
        <div class="logo-icon">\
          <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">\
            <rect x="2" y="8" width="28" height="16" rx="2" stroke="currentColor" stroke-width="2" fill="none"/>\
            <rect x="6" y="12" width="8" height="8" rx="1" fill="currentColor"/>\
            <rect x="18" y="12" width="8" height="8" rx="1" fill="currentColor"/>\
            <circle cx="12" cy="6" r="1" fill="currentColor"/>\
            <circle cx="20" cy="6" r="1" fill="currentColor"/>\
            <path d="M2 16 L8 16" stroke="currentColor" stroke-width="2"/>\
            <path d="M24 16 L30 16" stroke="currentColor" stroke-width="2"/>\
          </svg>\
        </div>\
        <div class="logo-text">\
          <span class="logo-main">Portails</span>\
          <span class="logo-sub">& Motorisation</span>\
        </div>\
      </a>\
    </div>\
    \
    <nav class="main-nav">\
      <ul class="nav-menu">\
        <li><a href="/#services">Services</a></li>\
        <li><a href="/#marques">Marques</a></li>\
        <li><a href="/#zones">Zones</a></li>\
        <li><a href="/#contact">Contact</a></li>\
      </ul>\
    </nav>\
    \
    <div class="header-actions">\
      <a class="phone-link" href="tel:0600000000">📞 06 00 00 00 00</a>\
      <a class="cta" href="/#devis">Devis Gratuit</a>\
    </div>\
    \
    <button class="mobile-menu-btn" onclick="toggleMobileMenu()">\
      <span></span>\
      <span></span>\
      <span></span>\
    </button>\
  </div>\
  \
  <div class="mobile-menu">\
    <ul>\
      <li><a href="/#services" onclick="toggleMobileMenu()">Services</a></li>\
      <li><a href="/#marques" onclick="toggleMobileMenu()">Marques</a></li>\
      <li><a href="/#zones" onclick="toggleMobileMenu()">Zones</a></li>\
      <li><a href="/#contact" onclick="toggleMobileMenu()">Contact</a></li>\
      <li><a href="/#devis" class="cta-mobile" onclick="toggleMobileMenu()">Devis Gratuit</a></li>\
    </ul>\
  </div>\
</header>' "$file"
done

# Mise à jour des pages de marques
for file in /app/public/marques/*.html; do
    echo "Mise à jour: $file"
    
    # Mise à jour du CSS avec cache busting
    sed -i 's|/assets/styles.css|/assets/styles.css?v=2|g' "$file"
    
    # Remplacement de l'ancien header (même traitement)
    sed -i '/<header class="header">/,/<\/header>/c\
<header class="header">\
  <div class="container nav">\
    <div class="logo-container">\
      <a class="logo" href="/">\
        <div class="logo-icon">\
          <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">\
            <rect x="2" y="8" width="28" height="16" rx="2" stroke="currentColor" stroke-width="2" fill="none"/>\
            <rect x="6" y="12" width="8" height="8" rx="1" fill="currentColor"/>\
            <rect x="18" y="12" width="8" height="8" rx="1" fill="currentColor"/>\
            <circle cx="12" cy="6" r="1" fill="currentColor"/>\
            <circle cx="20" cy="6" r="1" fill="currentColor"/>\
            <path d="M2 16 L8 16" stroke="currentColor" stroke-width="2"/>\
            <path d="M24 16 L30 16" stroke="currentColor" stroke-width="2"/>\
          </svg>\
        </div>\
        <div class="logo-text">\
          <span class="logo-main">Portails</span>\
          <span class="logo-sub">& Motorisation</span>\
        </div>\
      </a>\
    </div>\
    \
    <nav class="main-nav">\
      <ul class="nav-menu">\
        <li><a href="/#services">Services</a></li>\
        <li><a href="/#marques">Marques</a></li>\
        <li><a href="/#zones">Zones</a></li>\
        <li><a href="/#contact">Contact</a></li>\
      </ul>\
    </nav>\
    \
    <div class="header-actions">\
      <a class="phone-link" href="tel:0600000000">📞 06 00 00 00 00</a>\
      <a class="cta" href="/#devis">Devis Gratuit</a>\
    </div>\
    \
    <button class="mobile-menu-btn" onclick="toggleMobileMenu()">\
      <span></span>\
      <span></span>\
      <span></span>\
    </button>\
  </div>\
  \
  <div class="mobile-menu">\
    <ul>\
      <li><a href="/#services" onclick="toggleMobileMenu()">Services</a></li>\
      <li><a href="/#marques" onclick="toggleMobileMenu()">Marques</a></li>\
      <li><a href="/#zones" onclick="toggleMobileMenu()">Zones</a></li>\
      <li><a href="/#contact" onclick="toggleMobileMenu()">Contact</a></li>\
      <li><a href="/#devis" class="cta-mobile" onclick="toggleMobileMenu()">Devis Gratuit</a></li>\
    </ul>\
  </div>\
</header>' "$file"
done

echo "✅ Mise à jour terminée!"