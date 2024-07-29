import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    isLoading.value = true;

    final response = await http.post(
      Uri.parse('https://recruitment-api.pyt1.stg.jmr.pl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'login': email,
        'password': password,
      }),
    );

    isLoading.value = false;

    // Print the status code and response body for debugging
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Check for the status field in the response
      if (data is Map<String, dynamic> && data['status'] == 'ok') {
        // Print a success message to the terminal
        print('Login successful: ${data['message']}');

        // Navigate to the home screen
        Get.offNamed('/home');
      } else {
        Get.offNamed('/home'); // remove this
        // Handle login failure, show error message from response
        print('Login failed: ${data['message']}');
        Get.snackbar(
          'Login Failed',
          data['message'] ?? 'Unknown error occurred',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      // Print an error message to the terminal
      print('Login failed with status code: ${response.statusCode}');
      Get.offNamed('/home'); // remove this
      // Handle login failure, show error message
      Get.snackbar(
        'Login Failed',
        'Invalid email or password',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
