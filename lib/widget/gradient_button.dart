import 'package:flutter/material.dart';
import 'package:lamchoi/font_color/pallete.dart';

class GradientButton extends StatelessWidget {
  GradientButton({Key? key, required this.textBtn, required this.fnLogin})
      : super(key: key);
  final String textBtn;
  final Function fnLogin;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = 400;
        if (constraints.maxWidth >= 1180) {
          maxWidth = constraints.maxWidth * 0.3;
        } else if (constraints.maxWidth >= 700) {
          maxWidth = constraints.maxWidth * 0.5;
        } else {
          maxWidth = constraints.maxWidth * 0.9;
        }

        return Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Pallete.gradient1,
                Pallete.gradient2,
                Pallete.gradient3,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ElevatedButton(
            onPressed: () => fnLogin(),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(maxWidth, 55), // Sử dụng chiều rộng tính toán
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Text(
              textBtn,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
        );
      },
    );
  }
}
