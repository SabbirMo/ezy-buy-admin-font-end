import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.suffixIcon,
    required this.labelText,
    this.obscureText = false,
    required this.controller,
  });

  final String text;
  final IconButton? suffixIcon;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff5A607F),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 16,
              color: Color(0xffA1A7C4),
            ),
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }
}
