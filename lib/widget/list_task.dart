// ignore_for_file: unnecessary_string_interpolations, must_be_immutable, avoid_print

import 'package:flutter/material.dart';

class ListTask extends StatelessWidget {
  ListTask({
    super.key,
    required this.index,
    required this.nametask,
  });
  late String nametask = '';
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      // height: 80,
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
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
        padding: const EdgeInsets.all(10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            child: Text(
              nametask,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ),
          const SizedBox(height: 5),
          IconButton(
            onPressed: () {
              print("đây là nút xóa nha, $key , $index");
            },
            icon: const Icon(Icons.restore_from_trash_rounded),
            color: const Color.fromARGB(255, 145, 7, 0),
          ),
        ]),
      ),
    );
  }
}
