// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> categories = const [
    {
      'name': 'Category',
      'color': Color(0xFFFFCF2F),
      'icon': Icon(
        Icons.accessibility_sharp,
        color: Colors.white,
        size: 40,
      ),
    },
    {
      'name': 'Classes',
      'color': Color(0xFF6FE08D),
      'icon': Icon(
        Icons.accessibility_new,
        color: Colors.white,
        size: 40,
      ),
    },
    {
      'name': 'Free Course',
      'color': Color(0xFF61BDFD),
      'icon': Icon(
        Icons.settings_accessibility_outlined,
        color: Colors.white,
        size: 40,
      ),
    },
    {
      'name': 'BookStore',
      'color': Color(0xFFFC7C7F),
      'icon': Icon(
        Icons.accessible,
        color: Colors.white,
        size: 40,
      ),
    },
    {
      'name': 'Live Course',
      'color': Color(0xFFCB84FB),
      'icon': Icon(
        Icons.accessible_forward_sharp,
        color: Colors.white,
        size: 40,
      ),
    },
    {
      'name': 'LeaderBoard',
      'color': Color.fromARGB(255, 63, 194, 43),
      'icon': Icon(
        Icons.add_alarm_sharp,
        color: Colors.white,
        size: 40,
      ),
    },
    {
      'name': 'LeaderBoard',
      'color': Color.fromARGB(255, 226, 131, 131),
      'icon': Icon(
        Icons.star_rate_rounded,
        color: Colors.white,
        size: 40,
      ),
    },
    {
      'name': 'LeaderBoard',
      'color': Color.fromARGB(255, 25, 146, 6),
      'icon': Icon(
        Icons.add_chart_rounded,
        color: Colors.white,
        size: 40,
      ),
    },
    {
      'name': 'LeaderBoard',
      'color': Color.fromARGB(255, 114, 123, 175),
      'icon': Icon(
        Icons.ac_unit_sharp,
        color: Colors.white,
        size: 40,
      ),
    },
  ];

  late SharedPreferences trangthai;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              GridView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth < 700 ? 3 : 6,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: categories[index]['color'],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: categories[index]['icon'],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categories[index]['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
