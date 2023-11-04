// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xff0C356A),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
