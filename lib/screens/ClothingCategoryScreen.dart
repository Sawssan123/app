import 'package:flutter/material.dart';
import 'ClothingDonationScreen.dart'; // Importer l'écran de donation

class ClothingCategoryScreen extends StatelessWidget {
  final String donationType; // Type de don reçu depuis l'écran précédent

  // Constructeur pour recevoir le type de don
  ClothingCategoryScreen({required this.donationType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Clothing Category'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            // Les différentes catégories de vêtements
            buildCategoryCard(context, 'Women', 'assets/women.png', Colors.purple),
            buildCategoryCard(context, 'Men', 'assets/men.png', Colors.blue),
            buildCategoryCard(context, 'Girl', 'assets/girl.png', Colors.pink),
            buildCategoryCard(context, 'Boy', 'assets/boy.png', Colors.lightBlue),
            buildCategoryCard(context, 'Baby', 'assets/baby.png', Colors.orange),
          ],
        ),
      ),
    );
  }

  // Widget pour chaque carte de catégorie
  Widget buildCategoryCard(
      BuildContext context, String category, String imagePath, Color color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Lorsque la catégorie est tapée, on passe à ClothingDonationScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClothingDonationScreen(
                donationType: donationType, // Transmettre le type de don
                selectedCategory: category, // Transmettre la catégorie sélectionnée
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 60),
            SizedBox(height: 10),
            Text(
              category,
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
