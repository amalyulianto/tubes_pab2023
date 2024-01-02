// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hows_life/providers/daftar_pasien_provider.dart';
import 'package:hows_life/screens/auth_screens/register_konselor_screen.dart';
import 'package:hows_life/screens/konselor/home_konselor_screen.dart';
import 'package:hows_life/services/daftar_services.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/widgets/loading_button.dart';
import 'package:hows_life/widgets/new_button.dart';

import 'package:hows_life/widgets/custom_input_decoration.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_providers.dart';
import '../../utils/session.dart';

class LoginKonselorScreen extends StatefulWidget {
  LoginKonselorScreen({Key? key}) : super(key: key);

  static String route = 'auth/login_konselor';

  @override
  State<LoginKonselorScreen> createState() => _LoginKonselorScreenState();
}

class _LoginKonselorScreenState extends State<LoginKonselorScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

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

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    DaftarPasienProvider daftarPasienProvider =
        Provider.of<DaftarPasienProvider>(context);
    handleSignIn() async {
      setState(() {
        // isLoading = true;
      });
      Navigator.pushNamedAndRemoveUntil(
          context, HomeKonselorScreen.route, (route) => false);
      if (_emailTextController.text.isEmpty ||
          _passwordTextController.text.isEmpty) {
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
      if (await authProvider.login(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kColorGreen,
            content: Text(
              'Kamu berhasil login!',
              textAlign: TextAlign.center,
            ),
          ),
        );
        // await daftarPasienProvider
        // .getConfirmedPasien(authProvider.user.authToken!);
        // createUserSession(authProvider.user);
        Navigator.pushNamedAndRemoveUntil(
            context, HomeKonselorScreen.route, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeKonselorScreen.route, (route) => false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kColorRed,
            content: Text(
              'Gagal Login!',
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
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Masuk sebagai Konselor',
                  style: textBold.copyWith(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: 36,
                ),
                emailInput(),
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
                        onPressed: handleSignIn,
                        text: 'Masuk',
                        color: kColorButton,
                      ),
                Spacer(),
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
