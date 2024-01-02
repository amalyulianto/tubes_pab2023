import 'package:flutter/material.dart';
import 'package:hows_life/widgets/main_appbar.dart';

import '../../theme.dart';

class MyJadwalScreen extends StatelessWidget {
  const MyJadwalScreen({Key? key}) : super(key: key);
  static String route = '/konselor/jadwal';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        appBar: mainAppBar(
          context: context,
          centerTitle: false,
          title: Text(
            'Jadwal Saya',
            style: textMain.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
