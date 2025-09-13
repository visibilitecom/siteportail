#!/bin/bash

echo "🎨 Amélioration des sections hero des pages internes..."

# Nouveau template de hero pour les pages internes
for file in /app/public/services/*.html /app/public/marques/*.html; do
    echo "Mise à jour hero: $file"
    
    # Remplacer la section hero
    sed -i '/<section class="hero">/,/<\/section>/c\
<section class="hero" style="min-height: 60vh; padding-top: 120px; background: linear-gradient(135deg, rgba(37, 99, 235, 0.9), rgba(37, 99, 235, 0.7));">\
  <div class="container">\
    <div class="hero-content" style="position: relative; z-index: 3; max-width: 800px; text-align: center; color: white; margin: 0 auto;">\
      <nav class="breadcrumbs" style="background: rgba(255, 255, 255, 0.1); color: white; padding: 0.5rem 1rem; border-radius: 15px; font-size: 0.9rem; margin-bottom: 2rem; display: inline-block;"><a href="/" style="color: white;">Accueil</a> / <span>Service</span></nav>\
      <h1 style="font-size: clamp(2rem, 5vw, 3rem); font-weight: 700; margin-bottom: 1rem;">TITRE_PAGE</h1>\
      <p style="font-size: 1.25rem; margin-bottom: 2rem; opacity: 0.9;">DESCRIPTION_PAGE</p>\
      <div style="display: flex; justify-content: center; gap: 1rem; flex-wrap: wrap;">\
        <a class="cta primary" href="/#devis" style="background: white; color: var(--primary); border: 2px solid white;">📋 Devis Gratuit</a>\
        <a class="cta secondary" href="tel:0600000000" style="background: rgba(255, 255, 255, 0.1); color: white; border: 2px solid white;">📞 Appel d'"'"'urgence</a>\
      </div>\
    </div>\
  </div>\
</section>' "$file"
done

echo "✅ Sections hero mises à jour!"

# Maintenant extraire le titre et la description de chaque page et les injecter
for file in /app/public/services/*.html /app/public/marques/*.html; do
    title=$(grep -o '<title>[^<]*' "$file" | sed 's/<title>//' | sed 's/ | .*//')
    description=$(grep -o 'name="description" content="[^"]*' "$file" | sed 's/name="description" content="//' | cut -c1-100)
    
    # Remplacer les placeholders
    sed -i "s/TITRE_PAGE/$title/g" "$file"
    sed -i "s/DESCRIPTION_PAGE/$description/g" "$file"
    
    echo "Titre et description mis à jour pour: $file"
done

echo "✅ Tous les titres et descriptions mis à jour!"