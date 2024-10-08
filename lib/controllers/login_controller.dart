import 'dart:convert';
import 'package:ceylontrailapp/controllers/newsfeed_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../models/login_response_model.dart';
import '../screen/home_screen.dart';


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
        Uri.parse('http://192.168.56.1:8083/api/v1/auth/login'),
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
          _showMessage('Success', 'Login successful', Colors.white, Colors.green);
          print('login successful');

          // Fetch posts after successful login
          Get.find<NewsfeedController>().fetchPosts();

          Get.to(() => const HomeScreen());
        } else {
          loginError.value = loginResponse.message;
          _showMessage('Error', loginResponse.message, Colors.white, Colors.red);

        }
      } else {

        loginError.value = 'Invalid email or password';
        _showMessage('Error', 'Invalid email or password', Colors.white, Colors.red);
      }
    } catch (e) {

      isLoading.value = false;
      loginError.value = 'An error occurred. Please try again later.';
      _showMessage('Error', 'An error occurred. Please try again later.', Colors.white, Colors.red);
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
