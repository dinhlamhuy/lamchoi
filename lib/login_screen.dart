// ignore_for_file: unused_local_variable, avoid_print, use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lamchoi/font_color/pallete.dart';
import 'package:lamchoi/layout/home_screen.dart';
import 'package:lamchoi/utility/md5.dart';
// import 'package:lamchoi/utility/app_url.dart';
import 'package:lamchoi/widget/gradient_button.dart';
import 'package:lamchoi/widget/login_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _LoginBtn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String username = usernameController.text;
    String password = passwordController.text;
    setState(() {
      _isLoading = true;
    });
    try {
      String pass = generateMd5(password).toString().toUpperCase();
      var response = await http.post(
        Uri.parse('https://192.168.32.100:7777/api/login'),
        body: {'User_Id': username, 'pass': pass},
      );
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        List<dynamic> jsonResponse = json.decode(response.body);
        Map<String, dynamic> jsonObject = jsonResponse[0];
        String Rp_User_Id = jsonObject['Rp_User_Id'];
        String Rp_User_name = jsonObject['Rp_User_name'];
        String Rp_Usere_level = jsonObject['Rp_Usere_level'];
        // String jsonUser = json.encode(jsonObject);
        if (Rp_User_Id.isNotEmpty) {
          // Đăng nhập thành công và có token
          sharedPreferences.setString("login", response.body);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ),
            (Route<dynamic> route) => false,
          );
          return;
        }
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Đăng nhập thất bại'),
            content: const Text('Tên đăng nhập hoặc mật khẩu không chính xác.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng hộp thoại
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Đăng nhập',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Pallete.backgroundColor),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage(
                      'images/signin_balls.png',
                    ),
                    height: MediaQuery.of(context).size.width >= 900
                        ? MediaQuery.of(context).size.height * 0.30
                        : MediaQuery.of(context).size.height * 0.15,
                  ),
                  const Text(
                    'Đăng nhập',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  LoginField(
                      labelText: 'ID người dùng',
                      controller: usernameController),
                  const SizedBox(height: 15),
                  LoginField(
                    labelText: 'Mật khẩu',
                    controller: passwordController,
                    isPassword: true,
                    hasPassword: true,
                  ),
                  const SizedBox(height: 15),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : GradientButton(
                          textBtn: 'Đăng nhập',
                          fnLogin: _LoginBtn,
                        ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
