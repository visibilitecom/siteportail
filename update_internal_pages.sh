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
echo "📱 Ajout du JavaScript pour le menu mobile..."

# Script JavaScript pour le menu mobile
JS_SCRIPT='
<script>
document.getElementById("current-year") && (document.getElementById("current-year").textContent = new Date().getFullYear());

// Mobile menu functionality
function toggleMobileMenu() {
  const mobileMenu = document.querySelector(".mobile-menu");
  const menuBtn = document.querySelector(".mobile-menu-btn");
  
  if (mobileMenu && menuBtn) {
    mobileMenu.classList.toggle("active");
    menuBtn.classList.toggle("active");
  }
}

// Smooth scrolling for navigation links
document.querySelectorAll("a[href^=\"#\"]").forEach(anchor => {
  anchor.addEventListener("click", function (e) {
    e.preventDefault();
    const target = document.querySelector(this.getAttribute("href"));
    if (target) {
      const headerHeight = document.querySelector(".header").offsetHeight;
      const targetPosition = target.offsetTop - headerHeight - 20;
      
      window.scrollTo({
        top: targetPosition,
        behavior: "smooth"
      });
    }
  });
});

// Header scroll effect
window.addEventListener("scroll", function() {
  const header = document.querySelector(".header");
  if (header) {
    if (window.scrollY > 100) {
      header.style.background = "rgba(255, 255, 255, 0.95)";
      header.style.backdropFilter = "blur(25px)";
    } else {
      header.style.background = "rgba(255, 255, 255, 0.98)";
      header.style.backdropFilter = "blur(20px)";
    }
  }
});
</script>'

# Ajout du script avant la balise </body> pour toutes les pages
for file in /app/public/services/*.html /app/public/marques/*.html; do
    # Vérifier si le script n'existe pas déjà
    if ! grep -q "toggleMobileMenu" "$file"; then
        # Ajouter le script avant </body>
        sed -i "s|</body>|$JS_SCRIPT\n</body>|" "$file"
        echo "JavaScript ajouté à: $file"
    fi
done

echo "✅ JavaScript ajouté à toutes les pages!"
