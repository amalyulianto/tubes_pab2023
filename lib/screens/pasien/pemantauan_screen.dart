import 'package:flutter/material.dart';
import 'package:hows_life/widgets/main_appbar.dart';

import '../../theme.dart';

class PemantauanScreen extends StatelessWidget {
  PemantauanScreen({Key? key}) : super(key: key);

  static String route = '/pasien/pemantauan';

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        appBar: mainAppBar(
          context: context,
          // key: _key,
          centerTitle: false,
          title: Text('Pemantauan Perkembangan'),
        ),
        body: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
