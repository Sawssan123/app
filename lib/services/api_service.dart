import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.1.102:5000/api/donations';

  // Obtenir tous les dons
  Future<List<dynamic>> getAllDonations() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur lors de la récupération des dons');
    }
  }

  // Ajouter un don
  Future<void> addDonation(Map<String, dynamic> donationData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(donationData),
    );

    if (response.statusCode != 201) {
      throw Exception('Erreur lors de l\'ajout du don');
    }
  }

  // Supprimer un don par ID
  Future<void> deleteDonation(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la suppression du don');
    }
  }
}
