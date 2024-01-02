import 'dart:convert';

import 'package:hows_life/models/pasien_model.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class HomeService {
  String baseUrl = 'https://howslifeapi.herokuapp.com/api/v1';

  Future<PasienModel> getHome(String token) async {
    var url = Uri.parse('$baseUrl/pasien/me');
    var headers = {'Authorization': token};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body)['data'];
      PasienModel pasien;
      pasien = PasienModel.fromJson(data);

      return pasien;
    } else {
      throw Exception('Gagal Get Home!');
    }
  }
}
