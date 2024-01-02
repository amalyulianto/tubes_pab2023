class PasienModel {
  String? name;
  bool? haveOnGoingRequest;
  String? status;
  String? detailed;

  PasienModel({this.haveOnGoingRequest, this.name, this.detailed, this.status});

  PasienModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    haveOnGoingRequest = json['haveOnGoingRequest'];
    status = json['konsultasi']['status'];
    detailed = json['konsultasi']['detailed'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'haveOnGoingRequest': haveOnGoingRequest,
      'detailed': detailed,
      'status': status,
    };
  }
}
