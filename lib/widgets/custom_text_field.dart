import 'package:flutter/material.dart';
import '../theme.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {required TextEditingController this.controller,
      required String this.hintText});

  TextEditingController controller = TextEditingController();
  final String hintText;
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      // margin: const EdgeInsets.symmetric(horizontal: 35),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        maxLines: 3,
        style: textMain.copyWith(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
        ),
      ),
    );
  }
}
