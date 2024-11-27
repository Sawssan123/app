import 'package:flutter/material.dart';
import 'DonationForm.dart'; // Importer l'écran de formulaire final

class ClothingDonationScreen extends StatefulWidget {
  final String donationType; // Type de don reçu
  final String selectedCategory; // Catégorie de vêtements reçue

  // Constructeur pour recevoir les paramètres
  ClothingDonationScreen({
    required this.donationType,
    required this.selectedCategory,
  });

  @override
  _ClothingDonationScreenState createState() => _ClothingDonationScreenState();
}

class _ClothingDonationScreenState extends State<ClothingDonationScreen> {
  // Liste des articles disponibles
  final List<String> clothingItems = [
    'Pants',
    'Shirt',
    'Shoes',
    'Coat',
    'Socks',
    'Dress',
    'T-shirt',
    'Shorts',
    'Other',
  ];

  String? selectedItem; // L'article sélectionné

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing Donation'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bannière en haut
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/banner.jpeg'), // Chemin vers l'image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select a Clothing Item',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: clothingItems.length,
                itemBuilder: (context, index) {
                  final item = clothingItems[index];
                  return RadioListTile<String>(
                    title: Text(item),
                    value: item,
                    groupValue: selectedItem,
                    activeColor: Colors.pink,
                    onChanged: (String? value) {
                      setState(() {
                        selectedItem = value; // Mettre à jour l'article sélectionné
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: selectedItem == null
                  ? null // Désactiver le bouton si aucun article n'est sélectionné
                  : () {
                      // Naviguer vers le formulaire avec les informations
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonationForm(
                            type: widget.donationType, // Transmettre le type de don
                            category: widget.selectedCategory, // Transmettre la catégorie
                            item: selectedItem!, // Transmettre l'article sélectionné
                          ),
                        ),
                      );
                    },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
