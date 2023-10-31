import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    required this.text,
    this.orangeBackground = true,
    this.fontSize = 50,
    this.width,
  });

  final String text;
  final bool orangeBackground;
  final double fontSize;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: orangeBackground ? const Color(0xFFFB6009) : Colors.transparent,
        // borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
