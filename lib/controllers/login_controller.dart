import 'package:ceylontrailapp/screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../theme/app_theme.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginResponse = LoginResponse(code: 0, message: '', data: LoginData(token: '')).obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8083/api/v1/auth/login'), // Replace with your backend URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(LoginRequest(email: email, password: password).toJson()),
      );

      if (response.statusCode == 200) {
        loginResponse.value = LoginResponse.fromJson(jsonDecode(response.body));
        Get.to(() => const HomeScreen());
        _showMessage('Login Successful', 'You have successfully logged in.', AppTheme.colors.primary_dark_3);
      } else {
        Get.to(() => const HomeScreen());// delete this later
        _showMessage('Login Failed', 'Invalid email or password.', AppTheme.colors.warning_light);
      }
    } catch (e) {
      Get.to(() => const HomeScreen());// delete this later
      print('Error: $e');
      _showMessage('Error', 'An error occurred. Please try again.',AppTheme.colors.warning_light);
    } finally {
      isLoading.value = false;
    }
  }

  void _showMessage(String title, String message, Color colorText) {
    Get.snackbar(
      title,
      message, // Semi-transparent background color
      colorText: colorText, // Text color
      snackPosition: SnackPosition.BOTTOM, // Position the snackbar at the bottom
      borderRadius: 10, // Rounded corners
      margin: const EdgeInsets.all(10), // Margin around the snackbar
      duration: const Duration(seconds: 2), // Duration to show the snackbar
    );
  }
}
