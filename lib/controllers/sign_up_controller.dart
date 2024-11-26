import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpController {
  final String apiUrl = 'https://your-api-url.com/signup'; // Replace with the actual API URL.

  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    try {
      final username = generateUsername();
      final response = await http.post(
        Uri.parse('http://localhost:8083/api/v1/auth/register-traveller'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          'firstname': firstname,
          'lastname': lastname,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'code': response.statusCode, 'message': 'Something went wrong'};
      }
    } catch (e) {
      return {'code': 500, 'message': 'An error occurred: $e'};
    }
  }

  String generateUsername() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    return 'user_$timestamp'; // Example username generation logic.
  }
}
