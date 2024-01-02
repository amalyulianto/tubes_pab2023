import 'package:flutter/cupertino.dart';
import 'package:hows_life/models/pasien_model.dart';
import 'package:hows_life/services/home_services.dart';

class HomeProvider with ChangeNotifier {
  PasienModel? _pasien;
  PasienModel get pasien => _pasien!;

  set pasien(PasienModel pasien) {
    _pasien = pasien;
    notifyListeners();
  }

  Future<void> getHome(String token) async {
    try {
      PasienModel pasien = await HomeService().getHome(token);
      _pasien = pasien;
      print(_pasien);
    } catch (e) {
      print(e);
    }
  }
}
