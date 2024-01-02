class ConfirmedPasienList {
  int? idPasien;
  String? name;
  int? age;
  String? kelamin;

  ConfirmedPasienList({this.age, this.idPasien, this.kelamin, this.name});

  ConfirmedPasienList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    idPasien = json['id_pasien'];
    kelamin = json['kelamin'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'kelamin': kelamin,
      'id_pasien': idPasien,
    };
  }
}
