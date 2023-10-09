import 'package:flutter/material.dart';
import 'package:lamchoi/layout/home_screen.dart';
// import 'package:lamchoi/login_screen.dart';

// import 'package:lamchoi/splash.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: HomeScreen(),
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
