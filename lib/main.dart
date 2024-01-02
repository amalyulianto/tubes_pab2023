// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hows_life/providers/auth_providers.dart';
import 'package:hows_life/providers/daftar_pasien_provider.dart';
import 'package:hows_life/providers/home_provider.dart';
import 'package:hows_life/providers/pasien_request_provider.dart';
import 'package:hows_life/screens/auth_screens/login_konselor_screen.dart';
import 'package:hows_life/screens/auth_screens/login_pasien_screen.dart';
import 'package:hows_life/screens/auth_screens/login_screen.dart';
import 'package:hows_life/screens/auth_screens/register_konselor_screen.dart';
import 'package:hows_life/screens/auth_screens/register_pasien_screen.dart';
import 'package:hows_life/screens/konselor/home_konselor_screen.dart';
import 'package:hows_life/screens/konselor/konsultasi_request_screen.dart';
import 'package:hows_life/screens/konselor/my_jadwal_screen.dart';
import 'package:hows_life/screens/konselor/pasien_detail_screen.dart';
import 'package:hows_life/screens/konselor/pasien_requests_screen.dart';
import 'package:hows_life/screens/pasien/daftar_konsultasi_screen.dart';
import 'package:hows_life/screens/pasien/dapat_konselor_screen.dart';
import 'package:hows_life/screens/pasien/home_pasien_screen.dart';
import 'package:hows_life/screens/pasien/konfirmasi_jadwal_screen.dart';
import 'package:hows_life/screens/pasien/pemantauan_screen.dart';
import 'package:hows_life/screens/pasien/pilih_jadwal_screen.dart';
import 'package:hows_life/screens/pasien/profile_pasien_screen.dart';
import 'package:hows_life/screens/pasien/tunggu_jadwal_screen.dart';
import 'package:hows_life/screens/splash_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DaftarPasienProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PasienRequestProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.route: (context) => LoginScreen(),
          LoginPasienScreen.route: (context) => LoginPasienScreen(),
          LoginKonselorScreen.route: (context) => LoginKonselorScreen(),
          RegisterPasienScreen.route: (context) => RegisterPasienScreen(),
          DaftarKonsultasiScreen.route: (context) => DaftarKonsultasiScreen(),
          DapatKonselorScreen.route: (context) => DapatKonselorScreen(),
          HomePasienScreen.route: (context) => HomePasienScreen(),
          KonfirmasiJadwalScreen.route: (context) => KonfirmasiJadwalScreen(),
          PemantauanScreen.route: (context) => PemantauanScreen(),
          PilihJadwalScreen.route: (context) => PilihJadwalScreen(),
          TungguJadwalScreen.route: (context) => TungguJadwalScreen(),
          ProfilePasienScreen.route: (context) => ProfilePasienScreen(),
          HomeKonselorScreen.route: (context) => HomeKonselorScreen(),
          PasienRequestsScreen.route: (context) => PasienRequestsScreen(),
          MyJadwalScreen.route: (context) => MyJadwalScreen(),
          KonsultasiRequestScreen.route: (context) => KonsultasiRequestScreen(),
          PasienDetailScreen.route: (contex) => PasienDetailScreen(),
          RegisterKonselorScreen.route: (context) => RegisterKonselorScreen(),
        },
        home: SplashScreen(),
      ),
    );
  }
}
