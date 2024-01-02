// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hows_life/providers/auth_providers.dart';
import 'package:hows_life/screens/pasien/konfirmasi_jadwal_screen.dart';
import 'package:hows_life/screens/pasien/pilih_jadwal_screen.dart';
import 'package:hows_life/services/daftar_services.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/main_appbar.dart';
import 'package:hows_life/widgets/custom_text_field.dart';
import 'package:hows_life/widgets/new_button.dart';
import 'package:provider/provider.dart';

class DaftarKonsultasiScreen extends StatefulWidget {
  const DaftarKonsultasiScreen({Key? key}) : super(key: key);

  static String route = '/pasien/daftar_konsultasi';

  @override
  State<DaftarKonsultasiScreen> createState() => _DaftarKonsultasiScreenState();
}

class _DaftarKonsultasiScreenState extends State<DaftarKonsultasiScreen> {
  int selectedValueKonselorType = 0;
  int selectedValueKonselorGender = 0;
  int selectedValueKonseling = 0;
  String konselorType = 'sebaya';
  String konselorGender = 'perempuan';
  bool riwayatKonseling = false;
  String dropdownValueSubjekMasalah = 'Keluarga';
  TextEditingController controllerRiwayat = TextEditingController();
  TextEditingController controllerKendala = TextEditingController();
  TextEditingController controllerUsaha = TextEditingController();

  var items = [
    'Keluarga',
    'Percintaan',
    'Pendidikan',
    'Pribadi',
    'Lainnya',
  ];

  Widget buildRadioKonselorGender() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: selectedValueKonselorGender,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    onChanged: (value) {
                      setState(
                        () {
                          selectedValueKonselorGender = 0;
                          konselorGender = 'perempuan';
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Perempuan',
                      style: textMain.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    activeColor: kColorButton,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    value: 1,
                    groupValue: selectedValueKonselorGender,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedValueKonselorGender = 1;
                          konselorGender = 'laki-laki';
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Laki-laki',
                      style: textMain.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              flex: 1,
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              value: 2,
              groupValue: selectedValueKonselorGender,
              onChanged: (value) {
                setState(
                  () {
                    selectedValueKonselorGender = 2;
                    konselorGender = 'bebas';
                  },
                );
              },
            ),
            Expanded(
              child: Text(
                'Bebas',
                style: textMain.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildRadioKonselorType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: selectedValueKonselorType,
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                onChanged: (value) {
                  setState(
                    () {
                      selectedValueKonselorType = 0;
                      konselorType = 'sebaya';
                    },
                  );
                },
              ),
              Expanded(
                child: Text(
                  'Teman Sebaya',
                  style: textMain.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child: Row(
            children: [
              Radio(
                activeColor: kColorButton,
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                value: 1,
                groupValue: selectedValueKonselorType,
                onChanged: (value) {
                  setState(
                    () {
                      selectedValueKonselorType = 1;
                      konselorType = 'profesional';
                    },
                  );
                },
              ),
              Expanded(
                child: Text(
                  'Profesional',
                  style: textMain.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget buildRadioKonseling() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: selectedValueKonseling,
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                onChanged: (value) {
                  setState(
                    () {
                      selectedValueKonseling = 0;
                      riwayatKonseling = true;
                    },
                  );
                },
              ),
              Expanded(
                child: Text(
                  'Sudah',
                  style: textMain.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child: Row(
            children: [
              Radio(
                activeColor: kColorButton,
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                value: 1,
                groupValue: selectedValueKonseling,
                onChanged: (value) {
                  setState(
                    () {
                      selectedValueKonseling = 1;
                      riwayatKonseling = false;
                    },
                  );
                },
              ),
              Expanded(
                child: Text(
                  'Belum',
                  style: textMain.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget buildForm() {
    return Container(
      child: Column(
        children: [
          Container(
            child: DropdownButtonFormField(
              // Initial Value
              value: dropdownValueSubjekMasalah,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Subjek Masalah',
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
              ),

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValueSubjekMasalah = newValue!;
                });
              },
            ),
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(
            controller: controllerRiwayat,
            hintText: 'Riwayat masalah yang dialami',
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(
            controller: controllerUsaha,
            hintText: 'Usaha yang telah dilakukan',
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(
            controller: controllerKendala,
            hintText: 'Kendala yang dialami',
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        appBar: mainAppBar(
          context: context,
          // key: _key,
          title: Text(
            'Daftar Konsultasi',
            style: textBold.copyWith(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih Konselor:',
                  style: textMain.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                buildRadioKonselorType(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Jenis Kelamin Konselor:',
                  style: textMain.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                buildRadioKonselorGender(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Apakah sudah pernah konsultasi di tempat lain sebelumnya?',
                  style: textMain.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                buildRadioKonseling(),
                SizedBox(
                  height: 16,
                ),
                buildForm(),
                SizedBox(
                  height: 24,
                ),
                NewButton(
                  onPressed: () async {
                    print(riwayatKonseling);
                    print(konselorGender);
                    print(konselorType);
                    print(controllerKendala.text);
                    print(controllerRiwayat.text);
                    print(controllerUsaha.text);
                    print(dropdownValueSubjekMasalah.toLowerCase());

                    if (await DaftarServices().daftarKonsultasi(
                        riwayat: true,
                        jenisKonselor: 'sebaya',
                        kelaminKonselor: 'perempuan',
                        subject: 'keluarga',
                        masalah: 'apasi',
                        usaha: 'tidak ada',
                        kendala: 'kendalaa',
                        token: authProvider.user.authToken!)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kColorGreen,
                          content: Text(
                            'Berhasil mengirim detail konsultasi',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                      Navigator.pushReplacementNamed(
                          context, PilihJadwalScreen.route);
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
                  color: kColorButton,
                  text: 'Daftar',
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
