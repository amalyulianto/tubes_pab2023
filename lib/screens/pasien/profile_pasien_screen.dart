import 'package:flutter/material.dart';
import 'package:hows_life/screens/auth_screens/login_screen.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/new_button.dart';

class ProfilePasienScreen extends StatelessWidget {
  const ProfilePasienScreen({Key? key}) : super(key: key);

  static String route = '/pasien/profile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: NewButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.route, (route) => false);
                },
                text: 'Logout',
                color: kColorRed,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
