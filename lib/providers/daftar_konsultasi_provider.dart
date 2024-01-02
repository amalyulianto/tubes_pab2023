import 'package:flutter/material.dart';

class DaftarKonsultasiProvider with ChangeNotifier {
  Future<bool> daftarKonsultasi({
    required String jenisKonselor,
    required String kelaminKonselor,
    required String subject,
    required bool riwayat,
    required String masalah,
    required String usaha,
    required String kendala,
    required String token,
  }) async {
    try {
      // UserModel user =
      //     await AuthService().login(email: email, password: password);
      // _user = user;
      // PasienModel pasien = await HomeService().getHome(user.authToken!);
      // _pasien = pasien;
      return true;
    } catch (e) {
      print(e);
      print('GAGAL LOGIN');
      return false;
    }
  }
}
