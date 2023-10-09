// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:lamchoi/widget/list_task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});
  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  late SharedPreferences trangthai;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topRight,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Thêm mới"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(30, 40),
                // fixedSize: const Size(
                //     double.infinity, 40), // Sử dụng chiều rộng tính toán
                backgroundColor: Colors.amber[300],
                shadowColor: const Color.fromARGB(255, 150, 63, 63),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTask(
              key: const ValueKey<int>(1),
              index: 1,
              nametask: 'Tập thể dục buổi sáng'),
        ],
      ),
    );
  }
}
