import 'package:flutter/material.dart';
import 'package:hows_life/theme.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    Key? key,
    this.title = '',
    this.color = kColorSubButton,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: textMain.copyWith(fontSize: 22, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
