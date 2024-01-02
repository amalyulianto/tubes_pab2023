import 'package:flutter/material.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/main_appbar.dart';
import 'package:hows_life/widgets/new_button_row.dart';

import '../../widgets/new_button.dart';

class DapatKonselorScreen extends StatelessWidget {
  static String route = '/pasien/dapat_konselor';

  DapatKonselorScreen({Key? key}) : super(key: key);

  Widget buildSocialMediaIcon(
      {required String image, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        image,
        width: 50,
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        appBar: mainAppBar(
            // key: _key,
            context: context,
            title: Image.asset(
              'images/logo.png',
            ),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Text(
                  'Hai, sapa konselor kamu dong! :D',
                  textAlign: TextAlign.center,
                  style: textBold.copyWith(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    color: kColorGrey2,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // width: double.infinity,
                  // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset('images/Avatar.png',
                            // width: double.infinity,
                            width: MediaQuery.of(context).size.width - 40),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          Text(
                            'Danny Yen',
                            style: textMain.copyWith(
                                color: Colors.black, fontSize: 22),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'PROFESIONAL',
                            style: textMain.copyWith(
                                color: Colors.black38, fontSize: 18),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '''Hallo, perkenalkan, saat ini saya berumur 32 tahun dan bekerja di rumah sakit swasta di daerah Jakarta.
Saya adalah konselor Anda. Apapun yang dirasa sangat menganggu, berbagi ceritalah bersamaku. ''',
                              style: textMain.copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildSocialMediaIcon(
                              image: 'images/whatsapp@3x.png', onTap: () {}),
                          buildSocialMediaIcon(
                              image: 'images/telegram@3x.png', onTap: () {}),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                NewButtonRow(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  width: MediaQuery.of(context).size.width - 60,
                  text: 'Kembali',
                  color: kColorSubButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
