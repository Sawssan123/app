import 'package:flutter/material.dart';

import 'package:doudou/screens/FurnitureDonationScreen.dart'; // Écran pour les meubles
import 'package:doudou/screens/DonationForm.dart'; // Formulaire général (livres/autres)
import 'package:doudou/screens/ClothingCategoryScreen.dart'; // Catégories de vêtements

class DonationTypeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        title: Text('Donation Type Selection'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Bannière en haut
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/banner.jpeg'), // Bannière d'accueil
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Grille des types de dons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Deux colonnes
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  // Bouton pour les vêtements
                  buildDonationCard(
                    context,
                    'Clothing',
                    'assets/Clothing.png',
                    Colors.purple,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClothingCategoryScreen(
                            donationType: 'Clothing', // Passer le type
                          ),
                        ),
                      );
                    },
                  ),
                  // Bouton pour les meubles
                  buildDonationCard(
                    context,
                    'Furniture',
                    'assets/furniture.png',
                    Colors.brown,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FurnitureDonationScreen(
                            donationType: 'Furniture', // Passer le type
                          ),
                        ),
                      );
                    },
                  ),
                  // Bouton pour les livres
                  buildDonationCard(
                    context,
                    'Books',
                    'assets/Books.png',
                    Colors.red,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonationForm(
                            type: 'Books', // Type de don
                            category: null,
                            item: null, 
                          ),
                        ),
                      );
                    },
                  ),
                  // Bouton pour les autres types de dons
                  buildDonationCard(
                    context,
                    'Other',
                    'assets/others.png',
                    Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonationForm(
                            type: 'Other', // Type de don
                            category: null,
                            item: null, 
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour une carte de sélection (avec redirection)
  Widget buildDonationCard(BuildContext context, String title, String imagePath,
      Color color, {required VoidCallback onTap}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: InkWell(
        onTap: onTap, // Action dynamique
        splashColor: color.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image associée
            Image.asset(
              imagePath,
              height: 60,
            ),
            SizedBox(height: 10),
            // Texte du type de don
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
