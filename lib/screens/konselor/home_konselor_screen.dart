import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors

import 'package:hows_life/providers/auth_providers.dart';
import 'package:hows_life/providers/daftar_pasien_provider.dart';
import 'package:hows_life/screens/konselor/my_jadwal_screen.dart';
import 'package:hows_life/screens/konselor/pasien_detail_screen.dart';
import 'package:hows_life/screens/konselor/pasien_requests_screen.dart';
import 'package:hows_life/screens/pasien/daftar_konsultasi_screen.dart';
import 'package:hows_life/screens/pasien/dapat_konselor_screen.dart';
import 'package:hows_life/screens/pasien/pemantauan_screen.dart';
import 'package:hows_life/theme.dart';
import 'package:provider/provider.dart';

import '../../widgets/button_grid.dart';
import '../../widgets/button_second_grid.dart';
import '../../widgets/main_appbar.dart';

class HomeKonselorScreen extends StatelessWidget {
  static String route = '/konselor/home';

  HomeKonselorScreen({Key? key}) : super(key: key);

  Widget buildWelcome(BuildContext context, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            // left: 8,
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat pagi, $name!',
                style: textBold.copyWith(color: Colors.white, fontSize: 22),
              ),
              Text(
                'Konselor',
                style: textMain.copyWith(color: kColorButton),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMainGrid(BuildContext context, AuthProvider authProvider,
      DaftarPasienProvider daftarPasienProvider) {
    return Column(
      children: [
        KonselorGridButton(
          onTap: () async {
            Navigator.pushNamed(context, MyJadwalScreen.route);
          },
          text: 'Jadwal Anda',
        ),
        SizedBox(
          height: 12,
        ),
        KonselorGridButton(
          onTap: () async {
            await daftarPasienProvider
                .getDaftarPasien(authProvider.user.authToken!);
            Navigator.pushNamed(context, PasienRequestsScreen.route);
          },
          text: 'Jadwal Permintaan Pasien',
        ),
      ],
    );
  }

  Widget buildDaftarPasien(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        PasienListRow(
          date: '21 agusts',
          gender: 'laki-laki',
          text: 'Amal',
          onTap: () {
            Navigator.pushNamed(context, PasienDetailScreen.route);
          },
        ),
        SizedBox(
          height: 12,
        ),
        PasienListRow(
          date: '21 agusts',
          gender: 'laki-laki',
          text: 'Amal',
          onTap: () {},
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    AuthProvider homeProvider = Provider.of<AuthProvider>(context);
    DaftarPasienProvider daftarPasienProvider =
        Provider.of<DaftarPasienProvider>(context);
    return SafeArea(
      child: Scaffold(
        // drawer: CustomDrawer(),
        backgroundColor: kColorBlue,
        appBar: mainAppBar(
          context: context,
          title: Image.asset('images/logo.png'),
          centerTitle: true,
          // key: _key,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildWelcome(context, homeProvider.pasien.name!),
                SizedBox(
                  height: 25,
                ),
                buildMainGrid(context, homeProvider, daftarPasienProvider),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Daftar Pasien',
                  style: textBold.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  children: daftarPasienProvider.confirmedPasien
                      .map(
                        (e) => Column(
                          children: [
                            PasienListRow(
                              date: e.age.toString(),
                              gender: e.kelamin!,
                              text: e.name!,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PasienDetailScreen.route);
                              },
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KonselorGridButton extends StatelessWidget {
  const KonselorGridButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: kColorBlue2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: textMain.copyWith(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black87),
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PasienListRow extends StatelessWidget {
  PasienListRow(
      {Key? key,
      required this.date,
      required this.gender,
      required this.text,
      required this.onTap})
      : super(key: key);
  final String text;
  final String gender;
  final String date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: kColorBlue2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: textMain.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  gender,
                  style: textMain.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  date,
                  style: textMain.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black87),
              padding: EdgeInsets.all(4),
              child: CircleAvatar(),
            )
          ],
        ),
      ),
    );
  }
}
