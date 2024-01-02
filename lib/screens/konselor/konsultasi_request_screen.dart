import 'package:flutter/material.dart';
import 'package:hows_life/providers/auth_providers.dart';
import 'package:hows_life/providers/daftar_konsultasi_provider.dart';
import 'package:hows_life/screens/konselor/home_konselor_screen.dart';
import 'package:hows_life/services/daftar_services.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/main_appbar.dart';
import 'package:provider/provider.dart';

import '../../providers/pasien_request_provider.dart';
import '../../widgets/new_button_row.dart';

class KonsultasiRequestScreen extends StatelessWidget {
  const KonsultasiRequestScreen({Key? key}) : super(key: key);
  static String route = '/konselor/konsultasi_request';

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

  @override
  Widget build(BuildContext context) {
    DaftarServices daftarServices;
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PasienRequestProvider pasienRequestProvider =
        Provider.of<PasienRequestProvider>(context);
    var data = pasienRequestProvider.pasien;
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 18,
              ),
              Text(
                '${data.name}, ${data.age}',
                style: textBold.copyWith(color: Colors.white, fontSize: 24),
              ),
              Text(
                '${data.created}',
                style: textMain.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: kColorBlue2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subjek Masalah',
                      style:
                          textMain.copyWith(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${data.subject}',
                        style: textMain.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Riwayat masalah',
                      style:
                          textMain.copyWith(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${data.masalah}',
                        style: textMain.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Usaha yang telah dilakukan',
                      style:
                          textMain.copyWith(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${data.usaha}',
                        style: textMain.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Kendala yang dialami',
                      style:
                          textMain.copyWith(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${data.kendala}',
                        style: textMain.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                height: 20,
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
                    onPressed: () async {
                      if (await DaftarServices().konfirmasiJadwal(
                          token: authProvider.user.authToken!,
                          id: data.linkKonfirmasi!.lastChars(2))) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: kColorGreen,
                            content: Text(
                              'Jadwal pasien terkonfirmasi!',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                        Navigator.pushNamedAndRemoveUntil(context,
                            HomeKonselorScreen.route, (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: kColorRed,
                            content: Text(
                              'Gagal Konfirmasi!',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    text: 'Konfirmasi',
                    color: kColorButton,
                    width: 160,
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension E on String {
  String lastChars(int n) => substring(length - n);
}
