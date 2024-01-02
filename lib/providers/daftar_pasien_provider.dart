import 'package:flutter/material.dart';
import 'package:hows_life/models/confirmed_pasien_list.dart';
import 'package:hows_life/models/daftar_pasien.dart';
import 'package:hows_life/services/daftar_pasien_services.dart';

class DaftarPasienProvider with ChangeNotifier {
  List<DaftarPasien> _daftarPasien = [];
  List<DaftarPasien> get daftarPasien => _daftarPasien;

  set daftarPasien(List<DaftarPasien> daftarPasien) {
    _daftarPasien = daftarPasien;
    notifyListeners();
  }

  List<ConfirmedPasienList> _confirmedPasien = [];
  List<ConfirmedPasienList> get confirmedPasien => _confirmedPasien;

  set confirmedPasien(List<ConfirmedPasienList> confirmedPasien) {
    _confirmedPasien = confirmedPasien;
    notifyListeners();
  }

  Future<void> getDaftarPasien(String token) async {
    try {
      List<DaftarPasien> data =
          await DaftarPasienServices().getDaftarPasien(token);
      _daftarPasien = data;
      // print(_allNews);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getConfirmedPasien(String token) async {
    try {
      List<ConfirmedPasienList> data =
          await DaftarPasienServices().getConfirmedPasienList(token);
      _confirmedPasien = data;
      // print(_allNews);
    } catch (e) {
      print(e);
    }
  }
}
