import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pasien_request.dart';

class PasienRequestServices {
  String baseUrl = 'https://howslifeapi.herokuapp.com/api/v1';
  Future<PasienRequest> getHome(String token, String id) async {
    var url = Uri.parse('$baseUrl/konselor/me/permintaan/$id');
    var headers = {'Authorization': token};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body)['data'];
      PasienRequest pasien;
      pasien = PasienRequest.fromJson(data);

      return pasien;
    } else {
      throw Exception('Gagal Get detail request!');
    }
  }
}
