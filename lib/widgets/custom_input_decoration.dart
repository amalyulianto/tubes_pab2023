import 'package:flutter/material.dart';
import 'package:hows_life/theme.dart';

InputDecoration buildInputDecoration(String label, String hint) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 15),
    // labelText: label,
    hintText: hint,
    filled: true,
    fillColor: kColorGrey,
    focusColor: kColorGrey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        50,
      ),
      borderSide: BorderSide(width: 0),
    ),
  );
}
