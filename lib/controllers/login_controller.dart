import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_response_model.dart';
import '../screen/home_screen.dart';
import 'newsfeed_controller.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginError = ''.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Variables to hold user data
  var accessToken = ''.obs;
  var role = ''.obs;
  var userId = 0.obs;
  var username = ''.obs;
  var useremail = ''.obs;  // Declare as RxString
  var firstname = ''.obs;
  var lastname = ''.obs;
  var accountState = false.obs;
  var profilePictureUrl = ''.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    loginError.value = '';

    try {
      final response = await http.post(
        Uri.parse('http://10.22.162.199:8083/api/v1/auth/login'),
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
          print('Login successful');

          // Save user data after successful login
          accessToken.value = loginResponse.data.accessToken;
          role.value = loginResponse.data.role;
          userId.value = loginResponse.data.userId;
          username.value = loginResponse.data.username;
          useremail.value = loginResponse.data.email;  // Correct assignment
          firstname.value = loginResponse.data.firstname;
          lastname.value = loginResponse.data.lastname;
          accountState.value = loginResponse.data.accountState;
          profilePictureUrl.value = loginResponse.data.profilePictureUrl ?? '';

          // Save token in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', loginResponse.data.accessToken);

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
}

class LoginResponse {
  final int code;
  final String message;
  final Data data;

  LoginResponse({required this.code, required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      code: json['code'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String accessToken;
  final String role;
  final int userId;
  final String username;
  final String email;
  final String firstname;
  final String lastname;
  final bool accountState;
  final String? profilePictureUrl;

  Data({
    required this.accessToken,
    required this.role,
    required this.userId,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.accountState,
    this.profilePictureUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json['accessToken'],
      role: json['role'],
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      accountState: json['accountState'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }
}
