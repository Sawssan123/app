import 'package:flutter/material.dart';
import 'package:doudou/screens/SubmitDonationScreen.dart'; // Importer l'écran suivant

class DonationForm extends StatefulWidget {
  final String type; // Type de donation (furniture, clothing, etc.)
  final String? category; // Catégorie de donation (peut être null)
  final String? item; // L'article sélectionné

  // Constructeur pour recevoir les données
  const DonationForm({
    Key? key,
    required this.type,
    required this.category,
    this.item,
  }) : super(key: key);

  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();
  String? condition;
  String? size;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Form'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image en haut
            Container(
              margin: const EdgeInsets.all(20),
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/banner.jpeg'), // Image locale
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            // Formulaire
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Champ "Condition"
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Condition',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the condition';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        condition = value;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Champ "Size"
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Size',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the size';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        size = value;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Champ "Description"
                    TextFormField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        description = value;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Bouton de soumission
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Envoyer les données à l'écran SubmitDonationScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubmitDonationScreen(
                                  type: widget.type,
                                  category: widget.category, // Passer la catégorie
                                  item: widget.item,
                                  condition: condition ?? '', // Passer condition (si null, passer une chaîne vide)
                                  size: size ?? '', // Passer size (si null, passer une chaîne vide)
                                  description: description ?? '', // Passer description (si null, passer une chaîne vide)
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
