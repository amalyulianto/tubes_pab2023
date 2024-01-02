import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hows_life/screens/auth_screens/login_screen.dart';
import 'package:hows_life/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //  void navigateUser() async {
  //   try {
  //     final result = await InternetAddress.lookup('example.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       print('connected');
  //       AuthProvider authProvider =
  //           Provider.of<AuthProvider>(context, listen: false);

  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       var sessionLogin = prefs.getBool('IS_LOGIN') ?? false;
  //       var sessionToken = prefs.getString('TOKEN');
  //       print(sessionLogin);
  //       print(sessionToken);
  //       if (sessionLogin) {
  //         authProvider.sessionLogin(sessionToken!);
  //         if (await authProvider.login(sessionToken)) {
  //           if (authProvider.jwtModel.status == 0) {
  //             if (authProvider.jwtModel.verification == null) {
  //               Navigator.pushReplacement(context,
  //                   MaterialPageRoute(builder: (context) => NotVerifiedPage()));
  //             } else {
  //               Navigator.pushReplacement(context,
  //                   MaterialPageRoute(builder: (context) => VerifyingPage()));
  //             }
  //           } else {
  //             Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => HomePage(),
  //               ),
  //             );
  //           }
  //         }
  //       } else {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => SignInPage(),
  //           ),
  //         );
  //       }
  //     }
  //   } on SocketException catch (_) {
  //     print('not connected');
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => NoInternetPage()));
  //   }
  // }

  getInit() async {
    Navigator.pushNamed(context, LoginScreen.route);
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, getInit);
  }

  @override
  void initState() {
    // TODO: implement initState
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorBlue,
        body: Center(
          child: Image.asset(
            'images/logo-hw-white.png',
            width: 200,
          ),
        ),
      ),
    );
  }
}
