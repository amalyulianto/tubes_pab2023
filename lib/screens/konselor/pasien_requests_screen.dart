import 'package:flutter/material.dart';
import 'package:hows_life/providers/auth_providers.dart';
import 'package:hows_life/providers/daftar_pasien_provider.dart';
import 'package:hows_life/providers/pasien_request_provider.dart';
import 'package:hows_life/screens/konselor/konsultasi_request_screen.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/main_appbar.dart';
import 'package:provider/provider.dart';

class PasienRequestsScreen extends StatelessWidget {
  const PasienRequestsScreen({Key? key}) : super(key: key);
  static String route = '/konselor/requests';

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
            Navigator.pushNamed(context, KonsultasiRequestScreen.route);
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

  @override
  Widget build(BuildContext context) {
    DaftarPasienProvider daftarPasienProvider =
        Provider.of<DaftarPasienProvider>(context);
    PasienRequestProvider pasienRequestProvider =
        Provider.of<PasienRequestProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        appBar: mainAppBar(
          context: context,
          centerTitle: false,
          title: Text(
            'Permintaan Pasien',
            style: textMain.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
                children: daftarPasienProvider.daftarPasien
                    .map(
                      (e) => Column(
                        children: [
                          PasienListRow(
                            date: e.created.toString(),
                            gender: e.jenisKelamin!,
                            text: e.name!,
                            onTap: () async {
                              await pasienRequestProvider.getHome(
                                authProvider.user.authToken!,
                                e.konsultasiId!.toString(),
                              );
                              Navigator.pushNamed(
                                  context, KonsultasiRequestScreen.route);
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    )
                    .toList()),
          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
