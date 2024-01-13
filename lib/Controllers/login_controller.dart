import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  Future<void> login(String username, String password, bool isMobile) async {
    isLoading(true);

    try {
      if (isValidCredentials(username, password, isMobile)) {
        var response = await http.post(
          Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'username': username,
            'password': password,
            'is_mobile': isMobile,
          }),
        );

        if (response.statusCode == 200) {
          var responseData = json.decode(response.body);
          await saveAccessToken(responseData['data']['access']);
        } else {
          print('Login failed: ${response.statusCode}');
        }
      } else {
        Get.snackbar(
          'Invalid Credentials',
          'Please provide valid username, password, and is_mobile values.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Error during login: $e');
    }

    isLoading(false);
  }

  bool isValidCredentials(String username, String password, bool isMobile) {
    return username == 'Rabeeh@vk' && password == 'Rabeeh@000' && isMobile;
  }

  Future<void> saveAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
  }

  String? getAccessToken() {
    SharedPreferences prefs = Get.find<SharedPreferences>();
    return prefs.getString('access_token');
  }
}
