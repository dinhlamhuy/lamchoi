// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '/utility/auth_utils.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // late SharedPreferences trangthai;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      authUtils.checkLoginStatus(context);
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Expanded(
            child: _getLogo(),
          ),
          const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              strokeWidth: 3, // độ dày
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("v 0.0.0 biết"),
        ],
      ),
    );
  }

  _getLogo() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              '/images/XSNt.gif',
            ),
            height: 200,
            width: 200,
          ),
          Text(
            'Tạp hoá App',
            style: TextStyle(fontSize: 32),
          )
        ],
      ),
    );
  }
}
