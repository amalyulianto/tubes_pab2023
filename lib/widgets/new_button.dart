import 'package:flutter/material.dart';

import '../theme.dart';

class NewButton extends StatelessWidget {
  const NewButton(
      {required this.onPressed,
      this.text = '',
      this.color = kColorYellow,
      this.textColor = Colors.black});
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
          ),
          child: Text(
            text,
            style: textMain.copyWith(color: textColor, fontSize: 18),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
