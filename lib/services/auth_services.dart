import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthService {
  String baseUrl = 'https://howslifeapi.herokuapp.com/api/v1';

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String jenisKelamin,
    required String tempatLahir,
    required String tanggalLahir,
    required String noInduk,
    required String noTelp,
  }) async {
    var url = Uri.parse('$baseUrl/auth/register/pasien');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'email': email,
        'name': name,
        'password': password,
        'jenis_kelamin': jenisKelamin,
        'tempat_lahir': tempatLahir,
        'tanggal_lahir': tanggalLahir,
        'no_induk': noInduk,
        'no_telepon': noTelp,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      print(response.body);
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      user.authToken = data['userId'];
      return user;
    } else {
      print(response.body);
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> registerKonselor({
    required String name,
    required String email,
    required String password,
    required String jenisKelamin,
    required String tempatLahir,
    required String tanggalLahir,
    required String noInduk,
    required String noTelp,
  }) async {
    var url = Uri.parse('$baseUrl/auth/register/konselor');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'email': email,
        'name': name,
        'password': password,
        'jenis_kelamin': jenisKelamin,
        'tempat_lahir': tempatLahir,
        'tanggal_lahir': tanggalLahir,
        'no_induk': noInduk,
        'no_telepon': noTelp,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      print(response.body);
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      user.authToken = data['userId'];
      return user;
    } else {
      print(response.body);
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/auth/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'email': email,
        'password': password,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      user.authToken = 'Bearer ' + data['accessToken'];

      return user;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Gagal Login');
    }
  }
}
