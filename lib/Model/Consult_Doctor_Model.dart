class ConsultDoctorModel {
  String? status;
  String? message;
  List<Users>? users;

  ConsultDoctorModel({this.status, this.message, this.users});

  ConsultDoctorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? username;
  String? email;
  String? mobileNumber;
  Null? medicalReport;
  Null? medicalReportUrl;
  String? role;
  int? age;
  String? gender;
  String? occupation;
  String? education;
  String? address;
  String? patientId;

  Users(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.mobileNumber,
        this.medicalReport,
        this.medicalReportUrl,
        this.role,
        this.age,
        this.gender,
        this.occupation,
        this.education,
        this.address,
        this.patientId});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    medicalReport = json['medical_report'];
    medicalReportUrl = json['medical_report_url'];
    role = json['role'];
    age = json['age'];
    gender = json['gender'];
    occupation = json['occupation'];
    education = json['education'];
    address = json['address'];
    patientId = json['patient_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['medical_report'] = this.medicalReport;
    data['medical_report_url'] = this.medicalReportUrl;
    data['role'] = this.role;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['occupation'] = this.occupation;
    data['education'] = this.education;
    data['address'] = this.address;
    data['patient_id'] = this.patientId;
    return data;
  }
}