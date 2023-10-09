// import 'package:flutter/gestures.dart';
// ignore_for_file: non_constant_identifier_names, unused_field, use_build_context_synchronously

import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lamchoi/login_screen.dart';
import 'package:lamchoi/screens/dashboard.dart';
import 'package:lamchoi/screens/setting.dart';
import 'package:lamchoi/screens/todolist.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences trangthai;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  late int _page = 0;
  List Screen = const [
    DashboardScreen(),
    ToDoListScreen(),
    DashboardScreen(),
    DashboardScreen(),
    SettingScreen(),
  ];
  List Title = const [
    'Trang chủ',
    'Danh sách',
    'Quét mã',
    'Máy tính',
    'Cài đặt',
  ];
  String Rp_User_Id = "";
  late String Rp_User_name = "";
  String Rp_Usere_level = "";
  Future<void> _loadTrangThai() async {
    trangthai = await SharedPreferences.getInstance();
    String? loginJson = trangthai.getString("login");

    if (loginJson != null) {
      List<dynamic> loginList = json.decode(loginJson);
      Map<String, dynamic> jsonObject = loginList[0];
      setState(() {
        Rp_User_Id = jsonObject['Rp_User_Id'];
        Rp_User_name = jsonObject['Rp_User_name'];
        Rp_Usere_level = jsonObject['Rp_Usere_level'];
      });
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadTrangThai();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trang chủ - Tạp hoá App',
      home: Scaffold(
        key: _scaffoldKey,
        body: ListView(
          children: [
            Container(
              padding:
                  const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: _page == 0
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      )
                    : const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.list,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                      if (_page != 0)
                        Text(
                          Title[_page],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      const Icon(
                        Icons.notifications_active,
                        size: 30,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  if (_page == 0) const SizedBox(height: 5),
                  if (_page == 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 15),
                      child: Text(
                        'Xin chào, $Rp_User_name',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                  if (_page == 0)
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tìm kiếm',
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 25,
                            )),
                      ),
                    ),
                ],
              ),
            ),
            Screen[_page],
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: 50,
          color: Colors.amber,
          buttonBackgroundColor: Colors.amber,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
          items: const <Widget>[
            Icon(Icons.home_outlined, size: 25),
            Icon(Icons.list, size: 25),
            Icon(Icons.qr_code_scanner_rounded, size: 25),
            Icon(Icons.calculate_outlined, size: 25),
            Icon(Icons.settings, size: 25),
          ],
        ),
      ),
    );
  }
}
