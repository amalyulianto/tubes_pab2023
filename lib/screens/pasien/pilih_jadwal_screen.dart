import 'package:flutter/material.dart';
import 'package:hows_life/screens/pasien/konfirmasi_jadwal_screen.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/main_appbar.dart';
import 'package:hows_life/widgets/new_button.dart';
import 'package:intl/intl.dart';

class PilihJadwalScreen extends StatefulWidget {
  const PilihJadwalScreen({Key? key}) : super(key: key);

  static String route = '/pasien/pilih_jadwal';

  @override
  State<PilihJadwalScreen> createState() => _PilihJadwalScreenState();
}

class _PilihJadwalScreenState extends State<PilihJadwalScreen> {
  int _selectedDate = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController _pickedDate = TextEditingController();
  DateTime datee = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: mainAppBar(
          context: context,
          // key: _key,
          centerTitle: false,
          title: Text(
            'Pilih Jadwal',
            style: textBold.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: kColorBlue,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Silakan pilih tanggal',
                style: textBold.copyWith(color: Colors.white, fontSize: 26),
              ),
              SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: GestureDetector(
                  child: TextFormField(
                    controller: _pickedDate,
                    textInputAction: TextInputAction.next,
                    // keyboardType: TextInputType.datetime,

                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime(2025),
                      );
                      if (_pickedDate != null) {
                        setState(() {
                          _pickedDate.text =
                              DateFormat('yyyy-MM-dd').format(date!);
                        });
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                      // labelText: label,
                      hintText: 'Tanggal',
                      // icon: Icon(Icons.calendar_today),
                      filled: true,
                      fillColor: kColorGrey,
                      focusColor: kColorGrey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                        borderSide: BorderSide(width: 0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: NewButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, KonfirmasiJadwalScreen.route);
                    },
                    color: kColorButton,
                    text: 'Kirim Jadwal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
