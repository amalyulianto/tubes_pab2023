import 'package:flutter/material.dart';
import 'package:hows_life/screens/pasien/tunggu_jadwal_screen.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/main_appbar.dart';
import 'package:hows_life/widgets/new_button_row.dart';

class KonfirmasiJadwalScreen extends StatelessWidget {
  KonfirmasiJadwalScreen({Key? key}) : super(key: key);

  static String route = '/pasien/konfirmasi_jadwal';

  Widget buildPilihanJadwal({String tanggal = 'Senin', String jam = '00.00'}) {
    return Column(
      children: [
        Text(
          tanggal,
          style: textMain.copyWith(fontSize: 18),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: kColorButton,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            jam,
            style: textMain.copyWith(fontSize: 18),
          ),
        )
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        appBar: mainAppBar(
          context: context,
          // key: _key,
          title: Text(
            'Jadwal Kamu',
            style: textBold.copyWith(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Preferensi Jadwal Kamu',
                  style: textBold.copyWith(color: Colors.white, fontSize: 22),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kColorGrey2,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Column(
                    children: [
                      buildPilihanJadwal(
                          tanggal: 'Senin, 4 April 2022', jam: '09.00'),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'atau',
                        style: textMain.copyWith(color: Colors.black45),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      buildPilihanJadwal(
                          tanggal: 'Senin, 4 April 2022', jam: '09.00'),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'atau',
                        style: textMain.copyWith(color: Colors.black45),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      buildPilihanJadwal(
                          tanggal: 'Senin, 4 April 2022', jam: '09.00'),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NewButtonRow(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Batal',
                      color: kColorSubButton,
                      width: 160,
                    ),
                    NewButtonRow(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            TungguJadwalScreen.route, (route) => false);
                      },
                      text: 'Konfirmasi',
                      color: kColorButton,
                      width: 160,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
