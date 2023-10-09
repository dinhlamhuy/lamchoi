// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lamchoi/font_color/pallete.dart';

class LoginField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  LoginField(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.isPassword = false,
      this.hasPassword = false})
      : super(key: key);
  late bool isPassword;
  late bool hasPassword;

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = 400;
      if (constraints.maxWidth >= 1180) {
        maxWidth = constraints.maxWidth * 0.3;
      } else if (constraints.maxWidth >= 700) {
        maxWidth = constraints.maxWidth * 0.5;
      } else {
        maxWidth = constraints.maxWidth * 0.9;
      }

      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: TextFormField(
          obscureText: widget.isPassword,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.borderColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.gradient2,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: widget.labelText,
            suffixIcon: widget.hasPassword
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isPassword = !widget.isPassword;
                        });
                      },
                      child: Icon(
                        widget.isPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      );
    });
  }
}
