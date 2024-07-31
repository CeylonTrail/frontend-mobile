import 'package:ceylontrailapp/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/login_response_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginError = ''.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    loginError.value = '';

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8083/api/v1/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final loginResponse = LoginResponse.fromJson(responseData);

        if (loginResponse.code == 200) {
          // Save token and user data
          // Navigate to home screen
          _showMessage('Success', 'Login successful', Colors.green);
          Get.to(() => const HomeScreen());
        } else {
          loginError.value = loginResponse.message;
          _showMessage('Error', loginResponse.message, Colors.red);
        }
      } else {
        loginError.value = 'Invalid email or password';
        _showMessage('Error', 'Invalid email or password', Colors.red);
      }
    } catch (e) {
      isLoading.value = false;
      loginError.value = 'An error occurred. Please try again later.';
      _showMessage('Error', 'An error occurred. Please try again later.', Colors.red);
    }
  }
}

void _showMessage(String title, String message, Color colorText) {
  Get.snackbar(
    title,
    message,
    colorText: colorText,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 10,
    margin: const EdgeInsets.all(10),
    backgroundColor: Colors.black.withOpacity(0.7), // Semi-transparent background color
    duration: const Duration(seconds: 2), // Duration to show the snackbar
  );
}
