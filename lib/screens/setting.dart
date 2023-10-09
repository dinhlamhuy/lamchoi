// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:lamchoi/widget/logout_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late SharedPreferences trangthai;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Container(
          // height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity, // Nút sẽ chiếm toàn bộ chiều rộng
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.cached_sharp),
                      label: const Text("Chuyển đổi tài khoản"),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity, // Nút sẽ chiếm toàn bộ chiều rộng
                    child: TextButton.icon(
                      onPressed: () =>
                          logoutButton.showLogoutConfirmationDialog(context),
                      icon: const Icon(Icons.logout),
                      label: const Text("Đăng xuất"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
