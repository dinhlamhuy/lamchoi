// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logoutButton {
  static Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    final SharedPreferences trangthai = await SharedPreferences.getInstance();

    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Không cho phép đóng dialog bằng cách bấm ra ngoài
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận đăng xuất'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có chắc chắn muốn đăng xuất?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
            ),
            TextButton(
              child: const Text('Đăng xuất'),
              onPressed: () {
                trangthai.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
