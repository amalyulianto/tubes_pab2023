// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/login_button.dart';

import 'login_konselor_screen.dart';
import 'login_pasien_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String route = '/auth';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Masuk sebagai',
                style: textTitle.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              LogInButton(
                title: 'Klien',
                onPressed: () {
                  Navigator.pushNamed(context, LoginPasienScreen.route);
                },
              ),
              SizedBox(
                height: 6,
              ),
              LogInButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginKonselorScreen.route);
                },
                title: 'Konselor',
                color: kColorButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}
