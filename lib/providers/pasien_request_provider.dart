import 'package:flutter/material.dart';
import 'package:hows_life/models/pasien_request.dart';
import 'package:hows_life/services/pasien_request_services.dart';

class PasienRequestProvider with ChangeNotifier {
  PasienRequest? _pasien;
  PasienRequest get pasien => _pasien!;

  set pasien(PasienRequest pasien) {
    _pasien = pasien;
    notifyListeners();
  }

  Future<void> getHome(String token, String id) async {
    try {
      PasienRequest pasien = await PasienRequestServices().getHome(token, id);
      _pasien = pasien;
      print(_pasien);
    } catch (e) {
      print(e);
    }
  }
}
