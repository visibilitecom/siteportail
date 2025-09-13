#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import glob
import re

def get_brand_content(brand_name):
    """Génère du contenu spécialisé par marque"""
    
    if brand_name == "Somfy":
        return f"""<h2>Spécialiste Somfy certifié en Île-de-France</h2>
<p>Dépannage et installation <strong>Somfy</strong> par techniciens agréés. Toute la gamme Somfy : Evolvia, Freevia, Slidymoov, Dexxo, Ixengo.</p>

<h3>Gammes Somfy les plus installées :</h3>
<ul class="ul">
<li><strong>Evolvia 400/500</strong> : portails battants jusqu'à 400kg par vantail</li>
<li><strong>Slidymoov 300/600</strong> : portails coulissants jusqu'à 300kg</li>
<li><strong>Freevia 280/600</strong> : motorisation enterrée haut de gamme</li>
<li><strong>Ixengo L 3S RTS</strong> : dernière génération avec IO-homecontrol</li>
</ul>

<div class="card accent-blue" style="margin: 2rem 0;">
<h4>🔧 Interventions Somfy courantes</h4>
<p><strong>Remplacement boîtier électronique</strong> : 280€ TTC<br>
<strong>Programmation télécommande Somfy</strong> : 45€<br>
<strong>Remplacement moteur Evolvia</strong> : 450€ TTC<br>
<em>Pièces d'origine, garantie 2 ans</em></p>
</div>"""

    elif brand_name == "Came":
        return f"""<h2>Service après-vente Came professionnel</h2>
<p>Réparation et maintenance <strong>Came</strong> toutes gammes. Spécialistes des portails lourds avec systèmes Fast, BK et Stylo.</p>

<h3>Expertise technique Came :</h3>
<ul class="ul">
<li><strong>Came Fast 7024</strong> : vérins hydrauliques 400kg par vantail</li>
<li><strong>Came BK-1800/2200</strong> : coulissants industriels jusqu'à 1800kg</li>
<li><strong>Came Stylo</strong> : motorisation enterrée design</li>
<li><strong>Cartes ZA3/ZBK</strong> : remplacement et programmation</li>
</ul>

<div class="card accent-orange" style="margin: 2rem 0;">
<h4>💼 Cas client Came récents</h4>
<p><strong>Paris 16e</strong> : Remplacement BK-1800 - 1650€ TTC<br>
<strong>Neuilly-sur-Seine</strong> : Fast 7024 + pose - 2100€ TTC<br>
<strong>Boulogne</strong> : Dépannage carte ZA3 - 180€ TTC</p>
</div>"""

    elif brand_name == "Nice":
        return f"""<h2>Technicien agréé Nice Road - Wingo - Robus</h2>
<p>Installation et dépannage <strong>Nice</strong> en Île-de-France. Gamme complète : Road, Wingo, Robus, Spin avec technologie Bluebus.</p>

<h3>Solutions Nice par application :</h3>
<ul class="ul">
<li><strong>Nice Road 400</strong> : coulissants résidentiels 400kg</li>
<li><strong>Nice Wingo 2024/4024</strong> : battants 200/400kg par vantail</li>
<li><strong>Nice Robus 600/1000</strong> : applications industrielles</li>
<li><strong>Nice Spin 6031</strong> : vérins électromécaniques</li>
</ul>

<div class="card accent-green" style="margin: 2rem 0;">
<h4>⚡ Interventions Nice prioritaires</h4>
<p><strong>Levallois-Perret</strong> : Wingo 4024 - intervention 2h<br>
<strong>Courbevoie</strong> : Road 400 + Bluebus - diagnostic gratuit<br>
<strong>La Défense</strong> : Robus 1000 industriel - maintenance</p>
</div>"""

    elif brand_name == "FAAC":
        return f"""<h2>Spécialiste FAAC - Robustesse industrielle</h2>
<p>Maintenance et réparation <strong>FAAC</strong> par techniciens certifiés. Expertise sur C720, Delta, Cyclo pour applications résidentielles et industrielles.</p>

<h3>Gammes FAAC prises en charge :</h3>
<ul class="ul">
<li><strong>FAAC C720</strong> : vérins hydrauliques 400/500kg</li>
<li><strong>FAAC Delta 2</strong> : coulissants jusqu'à 500kg</li>
<li><strong>FAAC Cyclo</strong> : portails industriels lourds</li>
<li><strong>Cartes E024/E145</strong> : électronique et accessoires</li>
</ul>

<div class="card accent-purple" style="margin: 2rem 0;">
<h4>🏭 Applications industrielles FAAC</h4>
<p><strong>Zones d'activité</strong> : Nanterre, Gennevilliers<br>
<strong>Maintenance préventive</strong> : contrats annuels<br>
<strong>Dépannage urgent</strong> : intervention sous 4h</p>
</div>"""

    elif brand_name == "BFT":
        return f"""<h2>Réparation BFT - Virgo, Phobos, Deimos</h2>
<p>Service <strong>BFT</strong> complet avec diagnostic électronique. Spécialistes Virgo enterré, Phobos battant et Deimos coulissant.</p>

<h3>Motorisations BFT courantes :</h3>
<ul class="ul">
<li><strong>BFT Virgo</strong> : motorisation enterrée jusqu'à 200kg</li>
<li><strong>BFT Phobos BT/NL</strong> : battants 250/400kg</li>
<li><strong>BFT Deimos BT/AC</strong> : coulissants 400/600kg</li>
<li><strong>Cartes Clonix/Rigel</strong> : électronique et radiocommandes</li>
</ul>

<div class="card accent-blue" style="margin: 2rem 0;">
<h4>🔧 Expertise BFT Paris</h4>
<p><strong>Dépannage Virgo</strong> : spécialité motorisation enterrée<br>
<strong>Programmation télécommandes</strong> : Mitto, Kleio<br>
<strong>Zones d'intervention</strong> : Paris, 92, 93, 94</p>
</div>"""

    elif brand_name == "Hörmann":
        return f"""<h2>Service agréé Hörmann - RotaMatic, ProMatic</h2>
<p>Maintenance <strong>Hörmann</strong> par techniciens certifiés. Gamme complète RotaMatic, ProMatic avec technologie BiSecur.</p>

<h3>Solutions Hörmann installées :</h3>
<ul class="ul">
<li><strong>RotaMatic 1/2/3</strong> : coulissants 400/800/1200kg</li>
<li><strong>ProMatic 3/4</strong> : battants 300/400kg par vantail</li>
<li><strong>LineaMatic</strong> : motorisation linéaire design</li>
<li><strong>BiSecur</strong> : radiocommandes sécurisées</li>
</ul>

<div class="card accent-green" style="margin: 2rem 0;">
<h4>🇩🇪 Qualité Hörmann garantie</h4>
<p><strong>Pièces d'origine</strong> : stock permanent disponible<br>
<strong>Formation continue</strong> : techniciens certifiés annuellement<br>
<strong>Garantie étendue</strong> : jusqu'à 5 ans sur motorisation</p>
</div>"""

    elif brand_name == "DEA":
        return f"""<h2>Réparation DEA - Geko, Mac, Kit Shark</h2>
<p>Dépannage <strong>DEA</strong> toutes gammes avec pièces d'origine. Expertise Geko battant, Mac coulissant et accessoires.</p>

<h3>Gammes DEA maintenues :</h3>
<ul class="ul">
<li><strong>DEA Geko</strong> : motorisation battants électromécanique</li>
<li><strong>DEA Mac</strong> : coulissants résidentiels et semi-industriels</li>
<li><strong>Kit Shark</strong> : solutions tout-en-un</li>
<li><strong>Cartes Net/Mixer</strong> : centrales de commande</li>
</ul>

<div class="card accent-orange" style="margin: 2rem 0;">
<h4>🔧 Interventions DEA spécialisées</h4>
<p><strong>Remplacement cartes</strong> : Net 24V, Mixer 230V<br>
<strong>Révision motoréducteur</strong> : Geko, Mac<br>
<strong>Programmation</strong> : télécommandes MIO</p>
</div>"""

    else:
        return """<h2>Service professionnel toutes marques</h2>
<p>Intervention rapide par techniciens qualifiés sur toutes les marques de motorisation de portail en Île-de-France.</p>"""

def process_brand_file(filepath):
    """Traite un fichier de marque"""
    
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        filename = os.path.basename(filepath).replace('.html', '')
        
        # Détermine la marque
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
        
        seo_content = get_brand_content(brand_name)
        
        # Cherche le pattern spécifique aux pages de marques
        patterns = [
            r'<p class="notice">Pense à ajouter.*?</p>',
            r'<p class="notice">.*?FAQ.*?</p>',
            r'<p class="notice">.*?références.*?</p>'
        ]
        
        replaced = False
        for pattern in patterns:
            if re.search(pattern, content, re.DOTALL | re.IGNORECASE):
                new_content = re.sub(pattern, seo_content, content, flags=re.DOTALL | re.IGNORECASE)
                if new_content != content:
                    with open(filepath, 'w', encoding='utf-8') as f:
                        f.write(new_content)
                    print(f"✅ Contenu {brand_name} développé pour: {filename}")
                    replaced = True
                    break
        
        if not replaced:
            print(f"⚠️  Pattern non trouvé dans: {filename}")
            
        return replaced
            
    except Exception as e:
        print(f"❌ Erreur lors du traitement de {filepath}: {e}")
        return False

def main():
    """Traite toutes les pages de marques"""
    print("🏭 Développement du contenu pour les pages de marques...")
    
    brands_files = glob.glob('/app/public/marques/*.html')
    brands_processed = 0
    
    for filepath in brands_files:
        if process_brand_file(filepath):
            brands_processed += 1
    
    print(f"\n🎉 Pages de marques traitées: {brands_processed}/{len(brands_files)}")

if __name__ == "__main__":
    main()