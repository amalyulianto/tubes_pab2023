// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hows_life/providers/auth_providers.dart';
import 'package:hows_life/providers/home_provider.dart';
import 'package:hows_life/screens/auth_screens/register_pasien_screen.dart';
import 'package:hows_life/screens/pasien/home_pasien_screen.dart';
import 'package:hows_life/theme.dart';
import 'package:hows_life/utils/session.dart';
import 'package:hows_life/widgets/loading_button.dart';
import 'package:hows_life/widgets/new_button.dart';
import 'package:hows_life/widgets/custom_text_field.dart';

import 'package:hows_life/widgets/custom_input_decoration.dart';
import 'package:provider/provider.dart';

class LoginPasienScreen extends StatefulWidget {
  LoginPasienScreen({Key? key}) : super(key: key);
  static String route = '/auth/login_pasien';

  @override
  State<LoginPasienScreen> createState() => _LoginPasienScreenState();
}

class _LoginPasienScreenState extends State<LoginPasienScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();
  bool isLoading = false;
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

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePasienScreen.route, (route) => false);
      setState(() {
        isLoading = true;
      });
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
        createUserSession(authProvider.user);
        Navigator.pushNamedAndRemoveUntil(
            context, HomePasienScreen.route, (route) => false);
      } else {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Masuk sebagai Pasien',
                      style:
                          textBold.copyWith(color: Colors.white, fontSize: 24),
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
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterPasienScreen.route);
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
    );
  }
}
