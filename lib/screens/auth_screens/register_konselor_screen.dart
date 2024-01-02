import 'package:flutter/material.dart';
import 'package:hows_life/screens/auth_screens/login_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_providers.dart';
import '../../theme.dart';
import '../../widgets/custom_input_decoration.dart';
import '../../widgets/loading_button.dart';
import '../../widgets/new_button.dart';

class RegisterKonselorScreen extends StatefulWidget {
  const RegisterKonselorScreen({Key? key}) : super(key: key);
  static String route = '/auth/konselor/register';
  @override
  State<RegisterKonselorScreen> createState() => _RegisterKonselorScreenState();
}

class _RegisterKonselorScreenState extends State<RegisterKonselorScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _tanggalLahirTextController =
      TextEditingController();

  final TextEditingController _nimTextController = TextEditingController();

  final TextEditingController _noTelpTextController = TextEditingController();

  final TextEditingController _namaTextController = TextEditingController();

  final TextEditingController _tempatLahirTextController =
      TextEditingController();

  DateTime? _tanggalLahir;
  int selectedValueGender = 0;
  bool isLoading = false;

  Widget buildRadioGender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Kelamin:',
          textAlign: TextAlign.left,
          style: textMain.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: selectedValueGender,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    onChanged: (value) {
                      setState(
                        () {
                          selectedValueGender = 0;
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
                    groupValue: selectedValueGender,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedValueGender = 1;
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
      ],
    );
  }

  Widget nimInput() {
    return TextFormField(
      controller: _nimTextController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: buildInputDecoration('NIM', 'NIM'),
    );
  }

  Widget ttlInput() {
    return TextFormField(
      controller: _tanggalLahirTextController,
      textInputAction: TextInputAction.next,
      // keyboardType: TextInputType.datetime,

      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1940),
          lastDate: DateTime(2025),
        );
        if (pickedDate != null) {
          setState(() {
            _tanggalLahirTextController.text =
                DateFormat('yyyy-MM-dd').format(pickedDate);
          });
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 15),
        // labelText: label,
        hintText: 'Tanggal Lahir',
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
    );
  }

  Widget namaInput() {
    return TextFormField(
      controller: _namaTextController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: buildInputDecoration('Nama', 'Nama'),
    );
  }

  Widget tempatLahirInput() {
    return TextFormField(
      controller: _tempatLahirTextController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: buildInputDecoration('Tempat Lahir', 'Tempat Lahir'),
    );
  }

  Widget noTelp() {
    return TextFormField(
      controller: _noTelpTextController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      decoration: buildInputDecoration('No Telp', 'No Telp'),
    );
  }

  Widget emailInput() {
    return TextFormField(
      // key: _formKey,
      // validator: (value) => value.isEmpty ? 'Masukkan email!' : null,
      controller: _emailTextController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: buildInputDecoration('Email', 'Email'),
    );
  }

  Widget passwordInput() {
    return TextFormField(
      // key: _formKey,

      // validator: (value) => value.isEmpty ? 'Masukkan password!' : null,
      controller: _passwordTextController,
      textInputAction: TextInputAction.next,
      obscureText: true,
      decoration: buildInputDecoration('Kata Sandi', 'Kata Sandi'),
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (_nimTextController.text.isEmpty ||
          _namaTextController.text.isEmpty ||
          _emailTextController.text.isEmpty ||
          _noTelpTextController.text.isEmpty ||
          _passwordTextController.text.isEmpty ||
          _tempatLahirTextController.text.isEmpty ||
          _tanggalLahirTextController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kColorRed,
            content: Text(
              'Isi semua data!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      if (await authProvider.registerKonselor(
        name: _namaTextController.text,
        email: _emailTextController.text,
        password: _passwordTextController.text,
        tempatLahir: _tempatLahirTextController.text,
        tanggalLahir: _tanggalLahirTextController.text,
        noInduk: _nimTextController.text,
        noTelp: _noTelpTextController.text,
        jenisKelamin: selectedValueGender == 0 ? 'laki-laki' : 'perempuan',
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kColorGreen,
            content: Text(
              'Kamu berhasil daftar!',
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.route,
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kColorRed,
            content: Text(
              'Gagal Register!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Daftar sebagai Konselor',
                        style: textBold.copyWith(
                            color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      emailInput(),
                      SizedBox(
                        height: 12,
                      ),
                      namaInput(),
                      SizedBox(
                        height: 12,
                      ),
                      tempatLahirInput(),
                      SizedBox(
                        height: 12,
                      ),
                      ttlInput(),
                      SizedBox(
                        height: 12,
                      ),
                      nimInput(),
                      SizedBox(
                        height: 12,
                      ),
                      buildRadioGender(),
                      SizedBox(
                        height: 12,
                      ),
                      noTelp(),
                      SizedBox(
                        height: 12,
                      ),
                      passwordInput(),
                      SizedBox(
                        height: 24,
                      ),
                      isLoading
                          ? LoadingButtonWidget()
                          : NewButton(
                              onPressed: handleSignUp,
                              text: 'Daftar',
                              color: kColorButton,
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterKonselorScreen.route);
                  },
                  child: Text(
                    'Belum mempunyai akun? Daftar di sini',
                    style: textMain.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
