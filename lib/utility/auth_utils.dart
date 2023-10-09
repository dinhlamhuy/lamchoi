// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'package:flutter/material.dart';
import 'package:lamchoi/login_screen.dart';
import 'package:lamchoi/layout/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authUtils {
  static Future<void> checkLoginStatus(BuildContext context) async {
    final trangthai = await SharedPreferences.getInstance();
    if (trangthai.getString("login") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    }
  }
}
