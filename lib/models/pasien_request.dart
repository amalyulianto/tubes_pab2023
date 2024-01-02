class PasienRequest {
  String? name;
  int? age;
  String? created;
  String? status;
  String? linkKonfirmasi;
  String? prefKonselorType;
  String? prefKonselorGender;
  String? subject;
  String? masalah;
  String? usaha;
  String? kendala;
  List<String>? preferenceTime;

  PasienRequest({
    this.age,
    this.created,
    this.name,
    this.status,
    this.kendala,
    this.linkKonfirmasi,
    this.masalah,
    this.prefKonselorGender,
    this.prefKonselorType,
    this.preferenceTime,
    this.subject,
    this.usaha,
  });

  PasienRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    created = json['created'];
    status = json['status'];
    linkKonfirmasi = json['linkKonfirmasi'];
    prefKonselorGender = json['pref_kelamin_konselor'];
    prefKonselorType = json['pref_konselor_type'];
    subject = json['subject_masalah'];
    masalah = json['permasalahan'];
    usaha = json['usaha'];
    kendala = json['kendala'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'created': created,
      'status': status,
      'linkKonfirmasi': linkKonfirmasi,
      'pref_konselor_type': prefKonselorType,
      'pref_kelamin_konselor': prefKonselorGender,
      'subject_masalah': subject,
      'permasalahan': masalah,
      'usaha': usaha,
      'kendala': kendala,
    };
  }
}
