class SlottoDoctorModel {
  String? status;
  String? message;
  List<Data>? data;

  SlottoDoctorModel({this.status, this.message, this.data});

  SlottoDoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  DoctorDetails? doctorDetails;
  String? date;
  String? fromTime;
  String? toTime;
  bool? status;
  int? doctor;

  Data(
      {this.id,
        this.doctorDetails,
        this.date,
        this.fromTime,
        this.toTime,
        this.status,
        this.doctor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorDetails = json['doctor_details'] != null
        ? new DoctorDetails.fromJson(json['doctor_details'])
        : null;
    date = json['date'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    status = json['status'];
    doctor = json['doctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.doctorDetails != null) {
      data['doctor_details'] = this.doctorDetails!.toJson();
    }
    data['date'] = this.date;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['status'] = this.status;
    data['doctor'] = this.doctor;
    return data;
  }
}

class DoctorDetails {
  int? id;
  String? name;
  String? email;
  String? mobileNumber;

  DoctorDetails({this.id, this.name, this.email, this.mobileNumber});

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    return data;
  }
}