class DaftarPasien {
  String? name;
  int? age;
  String? jenisKelamin;
  String? created;
  String? statusKonsultasi;
  String? link;
  int? konsultasiId;

  DaftarPasien(
      {this.age,
      this.created,
      this.jenisKelamin,
      this.name,
      this.statusKonsultasi,
      this.konsultasiId,
      this.link});

  DaftarPasien.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    jenisKelamin = json['jenis_kelamin'];
    created = json['created'];
    statusKonsultasi = json['statuskonsultasi'];
    link = json['link'];
    konsultasiId = json['konsultasiId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'jenis_kelamin': jenisKelamin,
      'created': created,
      'statuskonsultasi': statusKonsultasi,
      'link': link,
      'konsultasiId': konsultasiId,
    };
  }
}
