import 'dart:convert';

import 'package:hows_life/models/confirmed_pasien_list.dart';
import 'package:hows_life/models/daftar_pasien.dart';
import 'package:http/http.dart' as http;

class DaftarPasienServices {
  String baseUrl = 'https://howslifeapi.herokuapp.com/api/v1';
  Future<List<DaftarPasien>> getDaftarPasien(String token) async {
    var url = Uri.parse('$baseUrl/konselor/me/permintaan');
    var headers = {'Authorization': token};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      // print(data);
      List<DaftarPasien> daftarPasien = [];

      for (var item in data) {
        daftarPasien.add(DaftarPasien.fromJson(item));
        // print(news);
      }
      print(daftarPasien);
      return daftarPasien;
    } else {
      throw Exception('Failed to get all news');
    }
  }

  Future<List<ConfirmedPasienList>> getConfirmedPasienList(String token) async {
    var url = Uri.parse('$baseUrl/konselor/me/mypasien');
    var headers = {'Authorization': token};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      // print(data);
      List<ConfirmedPasienList> daftarPasien = [];

      for (var item in data) {
        daftarPasien.add(ConfirmedPasienList.fromJson(item));
        // print(news);
      }
      print(daftarPasien);
      return daftarPasien;
    } else {
      throw Exception('Failed to get all news');
    }
  }
}
