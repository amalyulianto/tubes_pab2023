import 'package:flutter/material.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/main_appbar.dart';

class PasienDetailScreen extends StatelessWidget {
  const PasienDetailScreen({Key? key}) : super(key: key);
  static String route = '/konselor/pasien_detail';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        appBar: mainAppBar(
          context: context,
          centerTitle: false,
          title: Text(
            'Perkembangan Pasien',
            style: textMain.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Amal',
                        style: textBold.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Laki-laki, 20 th',
                        style: textMain.copyWith(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Total Pertemuan: ',
                      style:
                          textBold.copyWith(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                      decoration: BoxDecoration(
                        color: kColorBlue2,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '4',
                        style: textBold.copyWith(
                            color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Review',
                      style:
                          textBold.copyWith(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '4',
                        style: textMain.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
