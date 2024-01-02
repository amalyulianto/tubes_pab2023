import 'dart:convert';
import 'package:http/http.dart' as http;

class DaftarServices {
  String baseUrl = 'https://howslifeapi.herokuapp.com/api/v1';

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
    var url = Uri.parse('$baseUrl/pasien/me/daftar');
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        "jenisKonselor": jenisKonselor,
        "kelaminKonselor": kelaminKonselor,
        "riwayatKonsultasi": riwayat,
        "subject": subject,
        "masalah": masalah,
        "usaha": usaha,
        "kendala": kendala,
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
      print(data);
      print('berhasi');
      return true;
    } else {
      print(response.body);
      throw Exception('Gagal daftar');
    }
  }

  Future<bool> batalkanJadwal({
    required String token,
  }) async {
    var url = Uri.parse('$baseUrl/pasien/me/cancel');
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'time': '2022-07-16 15:00:00',
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      print(data);
      print('berhasil batalin jadwal');
      return true;
    } else {
      print(response.body);
      throw Exception('Gagal batalin');
    }
  }

  Future konfirmasiJadwal({
    required String token,
    required String id,
  }) async {
    var url = Uri.parse('$baseUrl/konselor/me/permintaan/$id');
    var headers = {'Authorization': token, 'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'time': '2022-07-16 15:00:00',
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      print(data);
      print('berhasil konfirmasi jadwal');
    } else {
      print(response.body);
      throw Exception('Gagal konfirmasi');
    }
  }
}
