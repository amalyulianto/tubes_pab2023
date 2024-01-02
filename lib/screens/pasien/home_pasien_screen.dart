// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hows_life/providers/auth_providers.dart';
import 'package:hows_life/providers/home_provider.dart';
import 'package:hows_life/screens/pasien/daftar_konsultasi_screen.dart';
import 'package:hows_life/screens/pasien/dapat_konselor_screen.dart';
import 'package:hows_life/screens/pasien/pemantauan_screen.dart';
import 'package:hows_life/screens/pasien/tunggu_jadwal_screen.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../../widgets/button_grid.dart';
import '../../widgets/button_second_grid.dart';
import '../../widgets/main_appbar.dart';

class HomePasienScreen extends StatelessWidget {
  static String route = '/pasien/home';

  HomePasienScreen({Key? key}) : super(key: key);

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
                'Semoga harimu menyenangkan',
                style: textMain.copyWith(color: kColorButton),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.notifications_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(
                context,
                DapatKonselorScreen.route,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildMainGrid(BuildContext context, AuthProvider authProvider) {
    return Row(
      children: [
        ButtonGrid(
          onTap: () {
            if (!authProvider.pasien.haveOnGoingRequest!) {
              Navigator.pushNamed(
                context,
                DaftarKonsultasiScreen.route,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kColorRed,
                  content: Text(
                    'Kamu sudah daftar konsultasi!',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          },
          color: kColorPurple,
          title: 'Daftar Konsultasi',
          image: 'images/konsultasi.png',
        ),
        SizedBox(width: 24),
        ButtonGrid(
          onTap: () {
            print(authProvider.pasien.status);
            if (authProvider.pasien.status == 'waiting') {
              Navigator.pushNamed(context, TungguJadwalScreen.route);
            } else if (authProvider.pasien.status == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kColorRed,
                  content: Text(
                    'Belum daftar ya gengs',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else {
              Navigator.pushNamed(
                context,
                PemantauanScreen.route,
              );
            }
          },
          color: kColorGrey,
          title: 'Pemantauan Perkembangan',
          image: 'images/pantau.png',
        ),
      ],
    );
  }

  Widget buildArticlesGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ButtonSecondGrid(
              onTap: () {},
              color: kColorButton,
              title: 'Jadilah diri sendiri yang hebat!',
              image: 'images/Frame.png',
            ),
            SizedBox(height: 8),
            ButtonSecondGrid(
              onTap: () {},
              color: kColorButton,
              title: 'Apakah kita butuh orang lain?',
              image: 'images/tanya.png',
            ),
          ],
        ),
        Column(
          children: [
            ButtonSecondGrid(
              onTap: () {},
              color: kColorButton,
              title: 'Mengapa tidak boleh merasa rendah diri?',
              image: 'images/tanya.png',
            ),
            SizedBox(height: 8),
            ButtonSecondGrid(
              onTap: () {},
              color: kColorButton,
              title: 'Kurangilah memikirkan hal yang tidak perlu!',
              image: 'images/gambar_1.png',
            ),
          ],
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    AuthProvider homeProvider = Provider.of<AuthProvider>(context);

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
                buildMainGrid(context, homeProvider),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Artikel untuk kamu',
                  style: textBold.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                buildArticlesGrid(),
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
