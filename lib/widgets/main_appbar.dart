import 'package:flutter/material.dart';
import 'package:hows_life/screens/pasien/profile_pasien_screen.dart';

import '../theme.dart';

AppBar mainAppBar({title, centerTitle, required BuildContext context}) {
  return AppBar(
    backgroundColor: kColorButton,
    // automaticallyImplyLeading: false,
    iconTheme: IconThemeData(color: Colors.black),
    title: title,
    centerTitle: centerTitle,
    actions: [
      GestureDetector(
        // onTap: key.currentState!.openDrawer,
        onTap: () {
          Navigator.pushNamed(context, ProfilePasienScreen.route);
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Image.asset(
            'images/avatar_male.png',
            width: 45,
          ),
        ),
      ),
    ],
  );
}
