#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import glob
import re

def get_seo_content_for_service(filename):
    """Génère du contenu SEO spécifique selon le type de service"""
    
    if "depannage" in filename:
        return """<h2>Dépannage express de portail électrique 24h/24</h2>
<p>Service de <strong>dépannage urgent de portail électrique</strong> avec intervention sous 2h en Île-de-France. Nos techniciens sont équipés des pièces les plus courantes pour une réparation immédiate.</p>

<h3>Pannes les plus fréquentes traitées :</h3>
<ul class="ul">
<li><strong>Portail bloqué fermé</strong> : défaut de fin de course, problème de crémaillère</li>
<li><strong>Télécommande inopérante</strong> : pile, fréquence, programmation</li>
<li><strong>Moteur qui force</strong> : mauvais réglage, obstacle, usure mécanique</li>
<li><strong>Clignotant allumé en permanence</strong> : défaut photocellules ou capteurs</li>
</ul>

<div class="card accent-pink" style="margin: 2rem 0;">
<h4>🚨 Interventions d'urgence Paris</h4>
<p>1er au 4e arrondissement - <strong>Temps moyen : 45 min</strong><br>
Boulogne, Neuilly, Levallois - <strong>Temps moyen : 1h15</strong></p>
</div>"""

    elif "installation" in filename:
        return """<h2>Installation professionnelle de motorisation de portail</h2>
<p>Nous réalisons l'<strong>installation complète de votre motorisation de portail</strong> avec étude préalable, pose, réglages et formation à l'utilisation. Intervention sur Paris, Hauts-de-Seine, Seine-Saint-Denis et Val-de-Marne.</p>

<h3>Nos spécialités par marque :</h3>
<ul class="ul">
<li><strong>Somfy</strong> : Evolvia, Freevia, Slidymoov (portails coulissants et battants)</li>
<li><strong>Came</strong> : Fast, BK, Stylo (spécialiste des portails lourds)</li>
<li><strong>Nice</strong> : Road, Wingo, Robus (solutions premium)</li>
<li><strong>FAAC</strong> : C720, Delta, Cyclo (robustesse industrielle)</li>
</ul>

<div class="card accent-orange" style="margin: 2rem 0;">
<h4>🏢 Paris Business District</h4>
<p>La Défense, Levallois-Perret, Neuilly-sur-Seine, Courbevoie - <strong>Spécialiste des résidences de standing</strong></p>
</div>"""

    elif "motorisation-portail-battant" in filename:
        return """<h2>Motorisation de portail battant : tous types de vantaux</h2>
<p>Spécialiste de la <strong>motorisation de portail battant</strong> à Paris et région parisienne. Nous équipons vos portails 1 ou 2 vantaux avec les meilleures technologies.</p>

<div class="grid cols-3" style="margin: 2rem 0;">
<div class="card accent-blue">
<h4>⚖️ Portails lourds</h4>
<p><strong>Vérins hydrauliques</strong><br>Came Fast, FAAC C720<br><em>400kg+ par vantail</em></p>
</div>
<div class="card accent-green">
<h4>⚖️ Portails standards</h4>
<p><strong>Moteurs à bras</strong><br>Somfy Evolvia, Nice Wingo<br><em>150-400kg par vantail</em></p>
</div>
<div class="card accent-purple">
<h4>⚖️ Portails légers</h4>
<p><strong>Motorisation enterrée</strong><br>Came Frog, BFT Virgo<br><em>Jusqu'à 200kg</em></p>
</div>
</div>"""

    elif "motorisation-portail-coulissant" in filename:
        return """<h2>Motorisation portail coulissant : rail et crémaillère</h2>
<p>Expert en <strong>motorisation de portail coulissant</strong> sur l'Île-de-France. Installation de systèmes à crémaillère, portails jusqu'à 2000kg.</p>

<h3>Solutions par poids de portail :</h3>
<div class="card accent-blue" style="margin: 2rem 0;">
<h4>Portails résidentiels (jusqu'à 800kg)</h4>
<p><strong>Somfy Slidymoov 300</strong> - Crémaillère nylon, 220V<br>
<strong>Prix indicatif : 1200€ TTC posé</strong></p>
</div>

<div class="card accent-orange" style="margin: 2rem 0;">
<h4>Portails lourds (800kg à 1500kg)</h4>
<p><strong>Came BK-1800</strong> - Crémaillère acier, encodeur<br>
<strong>Prix indicatif : 1800€ TTC posé</strong></p>
</div>"""

    elif "carte" in filename or "electronique" in filename:
        return """<h2>Réparation carte électronique et programmation</h2>
<p>Diagnostic et <strong>réparation de carte électronique de portail</strong> toutes marques. Remplacement, reprogrammation et mise à jour firmware par nos techniciens spécialisés.</p>

<h3>Interventions courantes :</h3>
<ul class="ul">
<li><strong>Carte grillée</strong> : remplacement avec sauvegarde des paramètres</li>
<li><strong>Perte de programmation</strong> : reprogrammation télécommandes</li>
<li><strong>Dysfonctionnement sécurités</strong> : calibrage photocellules</li>
<li><strong>Problème de communication</strong> : test et réparation bus</li>
</ul>

<div class="card accent-green" style="margin: 2rem 0;">
<h4>🔧 Spécialités techniques</h4>
<p>✅ Diagnostic électronique complet<br>
✅ Test des entrées/sorties<br>
✅ Programmation télécommandes<br>
✅ Mise à jour firmware</p>
</div>"""

    elif "entretien" in filename:
        return """<h2>Entretien préventif de portail automatique</h2>
<p><strong>Contrat d'entretien annuel</strong> pour maintenir votre portail en parfait état. Révision complète, graissage, réglages et vérification des sécurités.</p>

<h3>Programme d'entretien complet :</h3>
<ul class="ul">
<li><strong>Contrôle mécanique</strong> : rails, gonds, roulements, crémaillère</li>
<li><strong>Vérification électrique</strong> : tensions, intensités, isolement</li>
<li><strong>Test sécurités</strong> : photocellules, feux, arrêt d'urgence</li>
<li><strong>Nettoyage et graissage</strong> : mécanismes, motoréducteur</li>
</ul>

<div class="card accent-blue" style="margin: 2rem 0;">
<h4>📅 Forfaits d'entretien annuel</h4>
<p><strong>Résidentiel</strong> : 180€/an (1 visite)<br>
<strong>Professionnel</strong> : 350€/an (2 visites)<br>
<em>Dépannage prioritaire inclus</em></p>
</div>"""

    else:
        # Contenu générique pour les autres services
        return """<h2>Service professionnel en Île-de-France</h2>
<p>Nos techniciens certifiés interviennent rapidement sur <strong>Paris et toute l'Île-de-France</strong> pour vos besoins en motorisation de portail. Service client réactif, devis gratuit et garantie étendue.</p>

<h3>Zones d'intervention prioritaires :</h3>
<ul class="ul">
<li><strong>Paris</strong> : Tous arrondissements, intervention express</li>
<li><strong>Hauts-de-Seine (92)</strong> : Boulogne, Neuilly, Levallois, Nanterre</li>
<li><strong>Seine-Saint-Denis (93)</strong> : Montreuil, Vincennes, Saint-Denis</li>
<li><strong>Val-de-Marne (94)</strong> : Créteil, Maisons-Alfort, Saint-Maur</li>
</ul>

<div class="card accent-blue" style="margin: 2rem 0;">
<h4>🏆 Nos garanties qualité</h4>
<p>✅ Techniciens certifiés toutes marques<br>
✅ Pièces d'origine avec garantie constructeur<br>
✅ Intervention sous 24h en cas d'urgence<br>
✅ Devis gratuit et sans engagement</p>
</div>"""

def get_seo_content_for_brand(filename):
    """Génère du contenu SEO spécifique selon la marque"""
    
    brand_name = ""
    if "somfy" in filename:
        brand_name = "Somfy"
    elif "came" in filename:
        brand_name = "Came"
    elif "nice" in filename:
        brand_name = "Nice"
    elif "faac" in filename:
        brand_name = "FAAC"
    elif "bft" in filename:
        brand_name = "BFT"
    elif "hormann" in filename:
        brand_name = "Hörmann"
    elif "dea" in filename:
        brand_name = "DEA"
    
    if brand_name:
        return f"""<h2>Spécialiste agréé {brand_name} en Île-de-France</h2>
<p>Service après-vente et dépannage <strong>{brand_name}</strong> avec techniciens certifiés. Pièces détachées d'origine, programmation télécommandes, mise à jour firmware et diagnostic électronique complet.</p>

<h3>Gammes {brand_name} prises en charge :</h3>
<div class="card accent-blue" style="margin: 2rem 0;">
<h4>🔧 Motorisations courantes</h4>
<p>Tous modèles de portails coulissants et battants {brand_name}<br>
<strong>Stock permanent de pièces détachées</strong> : cartes, moteurs, télécommandes</p>
</div>

<h3>Interventions {brand_name} par secteur :</h3>
<ul class="ul">
<li><strong>Paris Centre</strong> : Dépannage express sous 2h</li>
<li><strong>Ouest parisien</strong> : Boulogne, Neuilly, Levallois - spécialité résidentiel</li>
<li><strong>Est parisien</strong> : Vincennes, Montreuil - expertise industrielle</li>
<li><strong>Sud parisien</strong> : Issy, Vanves - maintenance préventive</li>
</ul>

<div class="card accent-green" style="margin: 2rem 0;">
<h4>📞 Urgence {brand_name} 24h/24</h4>
<p><strong>06 00 00 00 00</strong><br>
Intervention d'urgence, diagnostic gratuit, devis immédiat<br>
<em>Spécialiste {brand_name} depuis 15 ans</em></p>
</div>"""
    
    return get_seo_content_for_service(filename)  # Fallback

def process_file(filepath):
    """Traite un fichier HTML pour remplacer le contenu SEO"""
    
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        filename = os.path.basename(filepath).replace('.html', '')
        
        # Détermine le type de contenu selon le dossier
        if '/services/' in filepath:
            seo_content = get_seo_content_for_service(filename)
        elif '/marques/' in filepath:
            seo_content = get_seo_content_for_brand(filename)
        else:
            seo_content = get_seo_content_for_service(filename)
        
        # Remplace le contenu SEO (utilise regex pour gérer les caractères spéciaux)
        pattern = r'<p class="notice">Astuce SEO.*?</p>'
        new_content = re.sub(pattern, seo_content, content, flags=re.DOTALL)
        
        # Si le pattern n'a pas été trouvé, essayons avec le texte exact
        if new_content == content:
            exact_text = '<p class="notice">Astuce SEO : ajoute ici des cas concrets, marques traitées et villes ciblées.</p>'
            new_content = content.replace(exact_text, seo_content)
        
        # Sauvegarde le fichier modifié
        if new_content != content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"✅ Contenu SEO développé pour: {filename}")
            return True
        else:
            print(f"⚠️  Pas de contenu SEO trouvé dans: {filename}")
            return False
            
    except Exception as e:
        print(f"❌ Erreur lors du traitement de {filepath}: {e}")
        return False

def main():
    """Fonction principale"""
    print("📝 Développement du contenu SEO pour toutes les pages internes...")
    
    # Traite toutes les pages de services
    services_files = glob.glob('/app/public/services/*.html')
    services_processed = 0
    
    for filepath in services_files:
        if process_file(filepath):
            services_processed += 1
    
    # Traite toutes les pages de marques
    brands_files = glob.glob('/app/public/marques/*.html')
    brands_processed = 0
    
    for filepath in brands_files:
        if process_file(filepath):
            brands_processed += 1
    
    print(f"\n🎉 Traitement terminé !")
    print(f"   ✅ Pages de services traitées: {services_processed}/{len(services_files)}")
    print(f"   ✅ Pages de marques traitées: {brands_processed}/{len(brands_files)}")
    print(f"   📊 Total: {services_processed + brands_processed} pages mises à jour")

if __name__ == "__main__":
    main()