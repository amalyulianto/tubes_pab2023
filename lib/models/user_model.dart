class UserModel {
  String? name;
  String? email;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? noInduk;
  String? noTelp;
  String? authToken;

  UserModel({
    this.name,
    this.email,
    this.jenisKelamin,
    this.noInduk,
    this.noTelp,
    this.tanggalLahir,
    this.tempatLahir,
    this.authToken,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    noInduk = json['no_induk'];
    noTelp = json['no_telp'];
    authToken = json['authToken'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'jenis_kelamin': jenisKelamin,
      'tempat_lahir': tempatLahir,
      'no_induk': noInduk,
      'no_telp': noTelp,
      'tanggal_lahir': tanggalLahir,
      'authToken': authToken,
    };
  }
}
