import 'package:ceylontrailapp/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpController extends GetxController {
  Future<Map<String, dynamic>> signUp({
    required String username,
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    final url = Uri.parse('http://10.22.162.199:8083/api/v1/auth/register-traveller');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },

        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          'firstname': firstname,
          'lastname': lastname,
        }),

      );

      if (response.statusCode == 200) {

        _showMessage('Sign Up Successful ', 'Please Sign In now', Colors.white, Colors.green);
        // Get.to(() => const SignInScreen());
        final data = jsonDecode(response.body);
        return {
          'code': 200,
          'message': data['message'] ?? 'Sign up successful',
        };

      } else {
        print(response.statusCode);
        print('Username: $username');
        print('Email: $email');
        print('Password: $password');
        print('Firstname: $firstname');
        print('Lastname: $lastname');

        final error = jsonDecode(response.body);
        return {
          'code': response.statusCode,
          'message': error['error'] ?? 'Something went wrong',
        };
      }
    } catch (e) {
      return {
        'code': 500,
        'message': 'Failed to connect to the server',
      };
    }
  }
}

void _showMessage(String title, String message, Color colorText, Color background) {
  Get.snackbar(
    title,
    message,
    colorText: colorText,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
    backgroundColor: background, // Semi-transparent background color
    duration: const Duration(seconds: 2), // Duration to show the snackbar
  );
}
