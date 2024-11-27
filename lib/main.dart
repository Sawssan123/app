import 'package:flutter/material.dart';
import 'screens/DonationTypeSelection.dart'; // Assurez-vous d'importer la page DonationTypeSelection

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(), // Page d'accueil
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Donation App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Donation App!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigation vers la page de sélection du type de don
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonationTypeSelection(),
                  ),
                );
              },
              child: Text('Donate Now'),
              style: ElevatedButton.styleFrom(
                
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
