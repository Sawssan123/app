import 'package:flutter/material.dart';
import 'DonationForm.dart'; // Importer l'écran suivant

class FurnitureDonationScreen extends StatefulWidget {
  final String donationType; // Type de don reçu (furniture)

  // Constructeur pour recevoir le type de don
  FurnitureDonationScreen({required this.donationType});

  @override
  _FurnitureDonationScreenState createState() =>
      _FurnitureDonationScreenState();
}

class _FurnitureDonationScreenState extends State<FurnitureDonationScreen> {
  // Liste des meubles disponibles
  final List<String> furnitureItems = [
    'Table',
    'Chair',
    'Sofa',
    'Bed',
    'Cupboard',
    'Desk',
    'Wardrobe',
    'Shelf',
    'Other',
  ];

  String? selectedItem; // L'article sélectionné

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Furniture Donation'),
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
                  image: AssetImage('assets/banner.jpeg'), // Chemin de l'image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select a Furniture Item',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: furnitureItems.length,
                itemBuilder: (context, index) {
                  final item = furnitureItems[index];
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
                      // Naviguer vers DonationForm avec les données
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonationForm(
                            type: widget.donationType, // Transmettre le type de don
                            category: '', // Catégorie vide
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
