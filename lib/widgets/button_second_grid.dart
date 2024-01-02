// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme.dart';

class ButtonSecondGrid extends StatelessWidget {
  const ButtonSecondGrid({
    this.color = kColorGrey,
    this.image = 'images/konsultasi.png',
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String image;
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        // height: 180,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),

        // height: 80,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              // width: 155,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textMain.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    ));
  }
}
