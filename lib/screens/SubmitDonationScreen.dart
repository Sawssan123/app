import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SubmitDonationScreen extends StatelessWidget {
  final String type;
  final String? category;
  final String? item;
  final String condition;
  final String size;
  final String description;

  // Constructeur pour recevoir les données
  const SubmitDonationScreen({
    Key? key,
    required this.type,
    this.category,
    this.item,
    required this.condition,
    required this.size,
    required this.description,
  }) : super(key: key);

  // Fonction pour soumettre le don
  Future<void> submitDonation(BuildContext context) async {
    // L'URL de votre backend
    final url = Uri.parse('http://192.168.1.102:5000/api/donations'); // Remplacez par votre propre URL

    // Le corps de la requête avec les données à envoyer
    final body = json.encode({
      'type': type,
      'category': category ?? '',
      'item': item ?? '',
      'condition': condition,
      'size': size,
      'description': description,
      // Vous pouvez également ajouter un champ image si nécessaire
    });

    try {
      // Envoyer la requête POST au serveur
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      // Vérifier la réponse du serveur
      if (response.statusCode == 201) {
        // Succès
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success'),
            content: Text('Donation added successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Fermer le dialog
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Erreur lors de l'ajout
        throw Exception('Failed to add donation');
      }
    } catch (error) {
      // Afficher un message d'erreur en cas d'échec de la requête
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to add donation: $error'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fermer le dialog
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Donation'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type: $type'),
            Text('Category: ${category ?? "N/A"}'), // Afficher "N/A" si category est null
            Text('Item: ${item ?? "N/A"}'),
            Text('Condition: $condition'),
            Text('Size: $size'),
            Text('Description: $description'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Appeler la fonction pour soumettre le don, en passant 'context' en paramètre
                submitDonation(context);
              },
              child: Text('Submit Donation'),
            ),
          ],
        ),
      ),
    );
  }
}
